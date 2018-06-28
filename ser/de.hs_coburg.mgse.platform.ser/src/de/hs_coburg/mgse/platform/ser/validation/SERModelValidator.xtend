/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.ser.validation

import org.eclipse.xtext.validation.Check
import de.hs_coburg.mgse.platform.ser.sERModel.StudyExaminationRegulations
import de.hs_coburg.mgse.platform.ser.sERModel.SERModelPackage
import de.hs_coburg.mgse.platform.ser.sERModel.Paragraph
import de.hs_coburg.mgse.platform.ser.sERModel.StudySection
import de.hs_coburg.mgse.platform.ser.sERModel.ExamType
import de.hs_coburg.mgse.platform.ser.sERModel.Module

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class SERModelValidator extends AbstractSERModelValidator {
	
	extension ModuleBehavior = new ModuleBehavior()
	
//	public static val INVALID_NAME = 'invalidName'
//
//	@Check
//	def checkGreetingStartsWithCapital(Greeting greeting) {
//		if (!Character.isUpperCase(greeting.name.charAt(0))) {
//			warning('Name should start with a capital', 
//					SERModelPackage.Literals.GREETING__NAME,
//					INVALID_NAME)
//		}
//	}


	// "The quanitifer of a module must be greater than 0."
	@Check
	def checkQuantifier(Module module) {
		val quantifier = module.getQuantifier()
		if (Double.parseDouble(quantifier) <= 0)
			error('The quanitifer of a module must be greater than 0', module, SERModelPackage.Literals.MODULE__QUANTIFIER)
	}

	// "The ECTS of a module must be greater than 0."
	@Check
	def checkModuleEcts(Module module) {
		val ects = module.getEcts()
		if (ects <= 0)
			error('The ECTS of a module must be greater than 0', module, SERModelPackage.Literals.MODULE__ECTS)
	}
	
	// "The semester hours of a module are ECTS * 1.5"
//	@Check
//	def checkSemesterHours(Module module) {
//		val semesterHours = module.getSemesterHours()
//		val ects = module.getEcts()
//		if (semesterHours != ects * 1.5)
//			error('The semester hours of a module are ECTS * 1.5', module, SERModelPackage.Literals.MODULE__SEMESTER_HOURS)
//	}
	
	// "The count of an abstract module should be greater than 0."
	@Check
	def checkCountModule(Module module) {
		if (module.isAbstract())
			if (module.count <= 0)
				error('The count of an abstract module should be greater than 0', module, SERModelPackage.Literals.MODULE__COUNT)
	}
	
	// "The total ECTS of an abstract module are the defined ects * the count attribute."
	@Check
	def checkTotalECTS(Module module) {
		val totalEcts = module.calculateEcts
		val ectsCount = module.ects * module.count
		
		if (module.abstract)
			if (totalEcts != ectsCount) {
				error('The total ECTS ' + totalEcts + ' do not match ' + ectsCount, module, SERModelPackage.Literals.MODULE__ECTS)
		}
		else {
			if (totalEcts != module.ects) {
				error('Module ECTS ' + module.ects + ' do not match the total ECTS ' + totalEcts, module, SERModelPackage.Literals.MODULE__ECTS)
			}
		}	
	}
	
	// count XOR details
	@Check
	def checkCountOrDetails(Module module) {
		if (module.isAbstract()) {
			checkCountModule(module)
		}
		else {
			if (module.details === null)
				error('An concrete module must have details', module, SERModelPackage.Literals.MODULE__DETAILS)
		}
	}

	// "The total ECTS of a study section are the sum of all ECTS of each module."
	//Context: StudySection
	//	inv: self.sumOfEcts() = self.modules.getEcts() -> sum()
	@Check
	def checkSumOfECTS(StudySection studySection) {
		val modules = studySection.getModules()
		//val studySectionSumEcts = studySection.sumOfEcts();
		var int moduleEctsSum = 0;
		for (var int i = 0; i < modules.size(); i++) {
			moduleEctsSum += modules.get(i).getEcts()
		}
		//if (studySectionSumEcts != moduleEctsSum) {
			//error(studySectionSumEcts + ' does not match ' + moduleEctsSum, studySection, SERModelPackage.Literals.MODULE__ECTS);
		//}
	}
	
	// "The total semester hours of a study section are the sum of all semester hours of each module."
	//Context: StudySection
	//	inv: self.sumOfSemesterHours() = self.modules.getSemesterHours() -> sum()
	@Check
	def checkSumOfSemesterHours(StudySection studySection) {
		val modules = studySection.getModules()
		//val studySectionSumHours = studySection.sumOfHours()
		var int moduleHourSum = 0;
		for (var int i = 0; i < modules.size(); i++) {
			moduleHourSum += modules.get(i).getSemesterHours()
		}
		//if (studySectionSumHours != moduleHourSum) {
			//error(studySectionSumHours + ' does not match ' + moduleHourSum, studySection, SERModelPackage.Literals.MODULE__SEMESTER_HOURS);
		//}
	}
	
	// "The first semester of a study section must be lower or equal to the last semester."
	@Check
	def checkFirstSemester(StudySection studySection) {
		val firstSemester = studySection.getFirstSemester()
		val lastSemester = studySection.getLastSemester()
		if (firstSemester > lastSemester)
			error('First semester=' + firstSemester + ' is greater than last semester=' + lastSemester, studySection, SERModelPackage.Literals.STUDY_SECTION__FIRST_SEMESTER);
	}
	
	// "The version of a SER should be greater than 0."
	@Check
	def checkVersionOfStudyExamination(StudyExaminationRegulations ser) {
		val version = ser.getVersion()
		if (version <= 0)
			error('The version of a study examination regulation should be greater than 0', ser, SERModelPackage.Literals.STUDY_EXAMINATION_REGULATIONS__VERSION)
	}
	
	// "The first and last semester of a study section must be lower or equal to the maximum semesters defined in the course of studies"
	@Check
	def checkMaxSemester(StudyExaminationRegulations ser) {
		
		val maxSemesters = ser.course.semester
		val studySections = ser.studySections

		for (var int i = 0; i < studySections.size(); i++) {
			if (studySections.get(i).firstSemester > maxSemesters)
				error('The first semester does not match the maximum semester=' + maxSemesters, ser, SERModelPackage.Literals.STUDY_SECTION__FIRST_SEMESTER);				
			if (studySections.get(i).lastSemester > maxSemesters)
				error('The last semester does not match the maximum semester=' + maxSemesters, ser, SERModelPackage.Literals.STUDY_SECTION__LAST_SEMESTER);
		}
	}
	
	// "The total ECTS of a SER is the sum of all ECTS of its study sections."
	@Check
	def checkTotalECTS(StudyExaminationRegulations ser) {
		
		//val serEcts = ser.sumOfEcts();

		//val studySectionTotalEcts = ser.studySections.sumOfEcts()
		
		//if (serEcts != studySectionTotalEcts)
			//error('The total ECTS do not match the sum of ECTS of the study sections', ser, SERModelPackage.Literals.STUDY_EXAMINATION_REGULATIONS__STUDY_SECTIONS);
	}
	
	// "The total semester hours of a SER is the sum of all semester hours of its study sections."
	@Check
	def checkSemesterHours(StudyExaminationRegulations ser) {
	
		//val serHours = ser.sumOfSemesterHours();

		//val studySectionTotalHours = ser.studySections.sumOfSemesterHours()
		
		//if (serHours != studySectionTotalSemesterHours)
			//error('The total semester hours do not match the sum of semester hours of the study sections', ser, SERModelPackage.Literals.STUDY_EXAMINATION_REGULATIONS__STUDY_SECTIONS);
	
	}
	
	// "The total sum of all ECTS defined in a SER must be the same as defined in its course of studies."
	@Check
	def checkSumECTS(StudyExaminationRegulations ser) {
		
		//val serTotalEcts = ser.sumOfEcts();

		//val maximumEcts = ser.course.getEcts()
		
		//if (serTotalEcts != maximumEcts)
			//error('The total ECTS do not match the sum of ECTS of the course of study', ser, SERModelPackage.Literals.STUDY_EXAMINATION_REGULATIONS__COURSE);
	}
	
	// "Paragraphs of a SER should have unique paragraph numbers."
	@Check
	def checkParagraphNumber(StudyExaminationRegulations ser) {
		val paragraphs = ser.paragraphs
		
		for (var int i = 0; i < paragraphs.size(); i++) {
			
			val pNumber = paragraphs.get(i).getNumber()
			
			for (var int j = 0; j < paragraphs.size(); j++) {
				if (i != j)
					if (pNumber == paragraphs.get(j).getNumber())
						error('The �' + pNumber + ' already exists', ser, SERModelPackage.Literals.PARAGRAPH__NUMBER);
			}
		}
	}
	
	// "Sub paragraphs of a paragraph should have unique paragraph numbers."
	@Check
	def checkSubParagraphNumber(Paragraph paragraph) {
		
		val subParagraphs = paragraph.subParagraphs
		
		for (var int i = 0; i < subParagraphs.size(); i++) {
			
			val pNumber = subParagraphs.get(i).getNumber()
			
			for (var int j = 0; j < subParagraphs.size(); j++) {
				if (i != j)
					if (pNumber == subParagraphs.get(j).getNumber())
						error('The subparagraph ��' + pNumber + ' already exists', paragraph, SERModelPackage.Literals.SUB_PARAGRAPH__NUMBER);
			}
		}
	}
	
	// "Paragraphs of a SER should be ordered by paragraph numbers."
	@Check
	def checkParagraphNumberOrder(StudyExaminationRegulations ser) {
		val paragraphs = ser.paragraphs
		
		for (var int i = 0; i < paragraphs.size(); i++) {
			
			if (i < paragraphs.size() - 1) {
				val pNumber = paragraphs.get(i).getNumber()
				val pNumberNext = paragraphs.get(i+1).getNumber()
			
				if (pNumber +1 != pNumberNext || paragraphs.get(0) != 1)
					error('The numbers of the paragraphs are not in order', ser, SERModelPackage.Literals.PARAGRAPH__NUMBER);
			}
		}
	}
		
	// "The lower bound of an exam type should be lower or equal to the upper bound."
	@Check
	def checkExamType(ExamType examType) {
		val lowerBound = examType.lowerBound
		val upperBound = examType.upperBound
		
		if (lowerBound > upperBound)
			error('The lower bound ' + lowerBound + ' of an exam should be lower or equal to ' + upperBound, examType, SERModelPackage.Literals.EXAM_TYPE__LOWER_BOUND);
	}
}
