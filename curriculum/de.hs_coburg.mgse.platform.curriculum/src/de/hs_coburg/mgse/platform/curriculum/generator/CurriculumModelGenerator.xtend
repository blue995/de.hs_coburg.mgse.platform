/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.curriculum.generator

import de.hs_coburg.mgse.platform.curriculum.curriculumModel.AidList
import de.hs_coburg.mgse.platform.curriculum.curriculumModel.Curriculum

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import java.util.Collection
import java.util.LinkedList
import de.hs_coburg.mgse.platform.ser.validation.ModuleBehavior

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class CurriculumModelGenerator extends AbstractGenerator {
	extension ModuleBehavior = new ModuleBehavior

	//counter for compileAids
	private int aidlist_counter = 0;
	private int aid_counter = 0;
	private Collection<AidList> toVisitAids
	
	//counter for compileCurriculums 
	private int curlist_counter = 0;
	private int cur_counter = 0;
	private int ms_counter = 0;
	private int cet_counter = 0;
	private int ctd_counter = 0;
	private int ms_aid_counter = 0;
	private int ms_caid_counter = 0;
	private int prof_counter = 0;
	private Collection<Curriculum> toVisitCurriculums
	
	new(){
		toVisitAids = null
		toVisitCurriculums = null
	}

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		
		//Aid Generation
		if(toVisitAids === null){
			val allAidsToGenerate = resource.resourceSet.resources.map[r | r.allContents.toIterable.filter(AidList)].flatten
			toVisitAids = new LinkedList<AidList>
			toVisitAids.addAll(allAidsToGenerate)
			fsa.generateFile("AidModelCreator.java", compileAids(toVisitAids))
		}
		
		//Curriculum Generation
		if(toVisitCurriculums === null){
			val allCurriculumsToGenerate = resource.resourceSet.resources.map[r | r.allContents.toIterable.filter(Curriculum)].flatten
			toVisitCurriculums = new LinkedList<Curriculum>
			toVisitCurriculums.addAll(allCurriculumsToGenerate)
			fsa.generateFile("CurriculumModelCreator.java", compileCurriculums(toVisitCurriculums))
		}
		
//		fsa.generateFile('greetings.txt', 'People to greet: ' + 
//			resource.allContents
//				.filter(Greeting)
//				.map[name]
//				.join(', '))
	}
	
	def compileAids(Collection<AidList> aids) '''
		package de.hs_coburg.mgse.persistence.creators;
		
		import de.hs_coburg.mgse.persistence.HibernateUtil;
		import javax.persistence.EntityManager;		
		
		import de.hs_coburg.mgse.persistence.model.Aid;
		
		public class AidModelCreator {
		    public static boolean createModel() {
		        boolean resp = true;
		        
		        «FOR al: aids»
		        	resp = resp && createModelPart«aidlist_counter++»();
		        «ENDFOR»
		        
		        return resp;
		    }
		
			//«aidlist_counter=0»: Aid
		    «FOR al: aids»
		    private static boolean createModelPart«aidlist_counter++»() {
		    	try {
		    		EntityManager em = HibernateUtil.getEntityManager();
		    		em.getTransaction().begin();
		    		
		    		//implement me
		    		«FOR aid: al.aidDefinitions»
		    		Aid a«aid_counter» = new Aid();
		    		a«aid_counter».setCompleteName("«aid.completeName»");
		    		em.persist(a«aid_counter++»);
		    		«ENDFOR»
		    		
		    		//commit and close Transaction
		    		em.getTransaction().commit();
		    		return true;
		    	} catch(Exception e) {
		    		e.printStackTrace();
		    		return false;
		    	}
		    }
		    «ENDFOR»
		}
	'''
	
	def compileCurriculums(Collection<Curriculum> curriculums) '''
		package de.hs_coburg.mgse.persistence.creators;
		
		import de.hs_coburg.mgse.persistence.HibernateUtil;
		import javax.persistence.EntityManager;
		import java.util.*;
		import java.util.stream.Collectors;
		
		import de.hs_coburg.mgse.persistence.model.*;
		
		public class CurriculumModelCreator {
		    public static boolean createModel() {
		        boolean resp = true;
		        
		        «FOR cur: curriculums»
		        	resp = resp && createModelPart«curlist_counter++»();
		        «ENDFOR»
		        
		        return resp;
		    }
		    
		    //«curlist_counter=0»: Aid
		    «FOR cur: curriculums»
		    private static boolean createModelPart«curlist_counter++»() {
		    	try {
		    		EntityManager em = HibernateUtil.getEntityManager();
		    		em.getTransaction().begin();
		    		
		    		Curriculum cur«cur_counter» = new Curriculum();
		    		cur«cur_counter».setCompleteName("«cur.completeName»");
		    		cur«cur_counter».setVersion(«cur.version»);
		    		cur«cur_counter».setYear(«cur.year»);
		    		cur«cur_counter».setSemester("«cur.semester»");
		    		StudyExaminationRegulations ser«cur_counter» = (StudyExaminationRegulations) em.createQuery("SELECT ser FROM StudyExaminationRegulations ser WHERE ser.version = «cur.ser.version» AND ser.title = '«cur.ser.title.replace('\n','').replace('\t','')»' AND ser.foreword = '«cur.ser.foreword.replace('\n','').replace('\t','')»'").getSingleResult();
		    		if(ser«cur_counter» != null) cur«cur_counter».setSer(ser«cur_counter»);
		    		
		    		//ModuleSpecification
		    		«IF cur.curriculumEntries.empty === false»
		    		List<ModuleSpecification> l_ms«cur_counter» = new ArrayList<ModuleSpecification>();
		    		«FOR ms: cur.curriculumEntries»
		    			ModuleSpecification ms«ms_counter» = new ModuleSpecification();
		    			ms«ms_counter».setCompleteName("«ms.name»");
		    			ms«ms_counter».setSemester(«ms.semester»);
		    			ms«ms_counter».setRota("«ms.rota»");
		    			
		    			//ModuleSpecification->Module
		    			Module m«ms_counter» = (Module) em.createQuery("SELECT m FROM Module m WHERE m.completeName = '«ms.moduleSpecification.module.name»' AND m.ects = «ms.moduleSpecification.module.ects» AND m.quantifier = «ms.moduleSpecification.module.quantifier» AND m.semesterHours = «ms.moduleSpecification.module.semesterHours»").getSingleResult();
		    			ms«ms_counter».setModule(m«ms_counter»);
		    			«IF ms.moduleSpecification.module.abstract»
		    			List<GlossaryEntry> entries«ms_counter» = HibernateUtil.getAllEntries(GlossaryEntry.class, em);
		    			List<GlossaryEntry> filtered«ms_counter» = entries«ms_counter».stream().filter(ge -> ge.getAbbreviation().equals("«ms.moduleSpecification.details.information.abbreviation»")).collect(Collectors.toList());
		    			if(filtered«ms_counter».size() != 1){
		    				throw new RuntimeException("Multiple GlossaryEntries with abbreviation «ms.moduleSpecification.details.information.abbreviation»:" + filtered«ms_counter»);
		    			}
		    			GlossaryEntry entry«ms_counter» = filtered«ms_counter».get(0);
		    			ms«ms_counter».setDetails(entry«ms_counter»);
		    			«ENDIF»
		    			
		    			//ConcreteExamType->ExamType
		    			List<ConcreteExamType> l_cet«ms_counter» = new ArrayList<ConcreteExamType>();
		    			«FOR cet: ms.moduleSpecification.concreteExamTypes»
		    			ConcreteExamType cet«cet_counter» = new ConcreteExamType();
		    			cet«cet_counter».setValue(«cet.value»);
		    			List<ExamType> examTypes«ms_counter» = m«ms_counter».getExamTypes().stream().filter(et -> et.getExamTypeDeclaration().getDetails().getAbbreviation().equals("«cet.examType.examTypeDeclaration.details.information.abbreviation»")).collect(Collectors.toList());
		    			if(examTypes«ms_counter».size() != 1){
		    			    throw new RuntimeException("Should find a single result of exam type, but found " + examTypes«ms_counter».size());
		    			}
		    			ExamType et«cet_counter» = examTypes«ms_counter».get(0);
		    			if(et«cet_counter» != null) cet«cet_counter».setExamType(et«cet_counter»);
		    			l_cet«ms_counter».add(cet«cet_counter++»);
		    			«ENDFOR»
		    			ms«ms_counter».setConcreteExamTypes(l_cet«ms_counter»);
		    			
		    			//CourseTypeDeclaration
		    			List<CourseTypeDeclaration> l_ctd«ms_counter» = new ArrayList<CourseTypeDeclaration>();
		    			«FOR ctd: ms.moduleSpecification.courseTypes»
		    			CourseTypeDeclaration ctd«ctd_counter» = (CourseTypeDeclaration) em.createQuery("SELECT ctd FROM CourseTypeDeclaration ctd WHERE ctd.details.abbreviation = '«ctd.details.information.abbreviation»' AND ctd.details.meaning = '«ctd.details.information.meaning»' AND ctd.details.word = '«ctd.details.information.word»'").getSingleResult();
		    			if(ctd«ctd_counter» != null) l_ctd«ms_counter».add(ctd«ctd_counter++»);
		    			«ENDFOR»
		    			ms«ms_counter».setCourseTypes(l_ctd«ms_counter»);
		    			
		    			//Aid
		    			List<Aid> l_aid«ms_counter» = new ArrayList<Aid>();
		    			«FOR aid: ms.aids»
		    			Aid aid«ms_aid_counter» = (Aid) em.createQuery("SELECT aid FROM Aid aid WHERE aid.completeName='«aid.completeName»'").getSingleResult();
		    			if(aid«ms_aid_counter» != null) l_aid«ms_counter».add(aid«ms_aid_counter++»);
		    			«ENDFOR»
		    			ms«ms_counter».setAids(l_aid«ms_counter»);
		    			
		    			//CustomAid
		    			List<CustomAid> l_caid«ms_counter» = new ArrayList<CustomAid>();
		    			«FOR caid: ms.customAids»
		    			CustomAid caid«ms_caid_counter» = new CustomAid();
		    			caid«ms_caid_counter».setCompleteName("«caid»");
		    			l_caid«ms_counter».add(caid«ms_caid_counter++»);
		    			«ENDFOR»
		    			ms«ms_counter».setCustomAids(l_caid«ms_counter»);
		    			
		    			//Professor (Tester)
		    			List<Professor> l_p«ms_counter» = new LinkedList<Professor>();
		    			«IF !ms.testers.empty»
		    			l_p«ms_counter».addAll(HibernateUtil.getAllEntries(Professor.class, em));
		    			l_p«ms_counter» = l_p«ms_counter».stream().
		    				filter(_p -> false «FOR p: ms.testers»|| _p.getAbbreviation().getAbbreviation().equals("«p.abbreviation.information.abbreviation»")«ENDFOR»).
		    				collect(Collectors.toList());	
		    			«ENDIF»	    			
		    			ms«ms_counter».setTesters(l_p«ms_counter»);
		    			
		    			l_ms«cur_counter».add(ms«ms_counter++»);
		    			«ENDFOR»
		    		cur«cur_counter».setModuleSpecifications(l_ms«cur_counter»);
		    		«ENDIF»
		    		
		    		em.persist(cur«cur_counter++»);
		    		
		    		//commit and close Transaction
		    		em.getTransaction().commit();
		    		return true;
		    	} catch(Exception e) {
		    		e.printStackTrace();
		    		return false;
		    	}
		    }
		    «ENDFOR»
		}
	'''
}
