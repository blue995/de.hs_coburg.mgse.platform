/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.course.validation

import org.eclipse.xtext.validation.Check
import de.hs_coburg.mgse.platform.course.courseModel.CourseOfStudies
import de.hs_coburg.mgse.platform.course.courseModel.CourseModelPackage

/**
 * This class contains custom validation rules. 
 *
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#validation
 */
class CourseModelValidator extends AbstractCourseModelValidator {
	
//	public static val INVALID_NAME = 'invalidName'
//
//	@Check
//	def checkGreetingStartsWithCapital(Greeting greeting) {
//		if (!Character.isUpperCase(greeting.name.charAt(0))) {
//			warning('Name should start with a capital', 
//					CourseModelPackage.Literals.GREETING__NAME,
//					INVALID_NAME)
//		}
//	}

	// "The ECTS of a course of studies must be greater than 1."
	@Check
	def checkECTS(CourseOfStudies cos) {
		val ects = cos.getEcts();
		if(ects <= 0) {
			error('Negative ECTS Value', cos, CourseModelPackage.Literals.COURSE_OF_STUDIES__ECTS);
		}
	}
	
	// "The total semester of a course of studies must be greater than 1."
	@Check
	def checkSemester(CourseOfStudies cos) {
		val sem = cos.getSemester();
		if(sem <= 0) {
			error('Negative Semester Value', cos, CourseModelPackage.Literals.COURSE_OF_STUDIES__SEMESTER);
		}
	}
}
