/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.ser.generator

import de.hs_coburg.mgse.platform.ser.sERModel.StudyExaminationRegulations
import de.hs_coburg.mgse.platform.ser.sERModel.CourseTypeDeclarationList
import de.hs_coburg.mgse.platform.ser.sERModel.ExamTypeDeclarationList
import de.hs_coburg.mgse.platform.ser.sERModel.Module

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import java.util.Collection
import java.util.LinkedList

import de.hs_coburg.mgse.platform.ser.utils.RichTextUtils

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class SERModelGenerator extends AbstractGenerator {

	//counter for CourseTypeDeclaration (Lehrveranstaltungen)
	private int ctd_counter = 0;
	private int ct_counter = 0;
	private Collection<CourseTypeDeclarationList> toVisitCourseTypeDeclaration
	
	//counter for ExamTypeDeclaration (Prüfungsarten)
	private int etd_counter = 0;
	private int et_counter = 0;
	private Collection<ExamTypeDeclarationList> toVisitExamTypeDeclaration
	
	//counter for Module
	private int m_counter = 0;
	private int mp_counter = 0;
	private int m_ctd_counter = 0;
	private int m_et_counter = 0;
	private Collection<Module> toVisitModule
	
	//counter for compileSPO
	private int spo_counter = 0;
	private int ser_counter = 0;
	private int ser_ss_counter = 0;
	private int ser_m_counter = 0;
	private int fn_counter = 0;
	private int p_counter = 0;
	private int sp_counter = 0;
	
	private int p_sent_counter = 0;
	private int sp_sent_counter = 0;
	private Collection<StudyExaminationRegulations> toVisitSPO
	
	new(){
		toVisitCourseTypeDeclaration = null
		toVisitExamTypeDeclaration = null
		toVisitModule = null
		toVisitSPO = null
	}
	
	RichTextUtils rtu  = new RichTextUtils
	
	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		
		//CourseTypeDeclaration
		if(toVisitCourseTypeDeclaration === null){
			val allCourseTypesToGenerate = resource.resourceSet.resources.map[r | r.allContents.toIterable.filter(CourseTypeDeclarationList)].flatten
			toVisitCourseTypeDeclaration = new LinkedList<CourseTypeDeclarationList>
			toVisitCourseTypeDeclaration.addAll(allCourseTypesToGenerate)
			fsa.generateFile("CourseTypeDeclarationModelCreator.java", compileCourseTypeDeclarations(toVisitCourseTypeDeclaration))
		}
		
		if(toVisitExamTypeDeclaration === null){
			val allExamTypesToGenerate = resource.resourceSet.resources.map[r | r.allContents.toIterable.filter(ExamTypeDeclarationList)].flatten
			toVisitExamTypeDeclaration = new LinkedList<ExamTypeDeclarationList>
			toVisitExamTypeDeclaration.addAll(allExamTypesToGenerate)
			fsa.generateFile("ExamTypeDeclarationModelCreator.java", compileExamTypeDeclarations(toVisitExamTypeDeclaration))
		}
		
		//Module Generation
		if(toVisitModule === null){
			val allModulesToGenerate = resource.resourceSet.resources.map[r | r.allContents.toIterable.filter(Module)].flatten
			toVisitModule = new LinkedList<Module>
			toVisitModule.addAll(allModulesToGenerate)
			fsa.generateFile("ModuleModelCreator.java", compileModules(toVisitModule))
		}
		
		//SPO Generation
		if(toVisitSPO === null){
			val allSposToGenerate = resource.resourceSet.resources.map[r | r.allContents.toIterable.filter(StudyExaminationRegulations)].flatten
			toVisitSPO = new LinkedList<StudyExaminationRegulations>
			toVisitSPO.addAll(allSposToGenerate)
			fsa.generateFile("SPOModelCreator.java", compileSPO(toVisitSPO))
		}
		
//		fsa.generateFile('greetings.txt', 'People to greet: ' + 
//			resource.allContents
//				.filter(Greeting)
//				.map[name]
//				.join(', '))
	}
	
	def compileCourseTypeDeclarations(Collection<CourseTypeDeclarationList> courseTypeDeclarations)'''
		package de.hs_coburg.mgse.persistence.creators;
		
		import de.hs_coburg.mgse.persistence.HibernateUtil;
		import javax.persistence.EntityManager;
		
		import de.hs_coburg.mgse.persistence.model.CourseTypeDeclaration;
		import de.hs_coburg.mgse.persistence.model.GlossaryEntry;

		public class CourseTypeDeclarationModelCreator {
		    public static boolean createModel() {
		        boolean resp = true;
		        
		        «FOR ctd: courseTypeDeclarations»
		        	resp = resp && createModelPart«ctd_counter++»();
		        «ENDFOR»
		        
		        return resp;
		    }
		    
		    //«ctd_counter=0»: CourseTypeDeclaration
			«FOR ctd: courseTypeDeclarations»
			private static boolean createModelPart«ctd_counter++»() {
				try {
					EntityManager em = HibernateUtil.getEntityManager();
					em.getTransaction().begin();
					
					«FOR ct: ctd.courseTypeDeclarations»
						CourseTypeDeclaration ctd«ct_counter» = new CourseTypeDeclaration();
						GlossaryEntry ge«ct_counter» = (GlossaryEntry) em.createQuery("SELECT ge FROM GlossaryEntry ge WHERE ge.abbreviation = '«ct.details.information.abbreviation»' AND ge.meaning = '«ct.details.information.meaning»' AND ge.word = '«ct.details.information.word»'").getSingleResult();
						ctd«ct_counter».setDetails(ge«ct_counter»);
						em.persist(ctd«ct_counter++»);
						
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
	
	def compileExamTypeDeclarations(Collection<ExamTypeDeclarationList> examTypeDeclarations)'''
		package de.hs_coburg.mgse.persistence.creators;
		
		import de.hs_coburg.mgse.persistence.HibernateUtil;
		import javax.persistence.EntityManager;
		
		import de.hs_coburg.mgse.persistence.model.ExamTypeDeclaration;
		import de.hs_coburg.mgse.persistence.model.GlossaryEntry;
		
		public class ExamTypeDeclarationModelCreator {
		    public static boolean createModel() {
		        boolean resp = true;
		        
		        «FOR etd: examTypeDeclarations»
		        	resp = resp && createModelPart«etd_counter++»();
		        «ENDFOR»
		        
		        return resp;
		    }
		
			//«etd_counter=0»: ExamTypeDeclaration
			«FOR etd: examTypeDeclarations»
			private static boolean createModelPart«etd_counter++»() {
				try {
					EntityManager em = HibernateUtil.getEntityManager();
					em.getTransaction().begin();
					
					«FOR et: etd.examTypeDeclarations»
						ExamTypeDeclaration etd«et_counter=et_counter+1» = new ExamTypeDeclaration();
						GlossaryEntry ge«et_counter» = (GlossaryEntry) em.createQuery("SELECT ge FROM GlossaryEntry ge WHERE ge.abbreviation = '«et.details.information.abbreviation»' AND ge.meaning = '«et.details.information.meaning»' AND ge.word = '«et.details.information.word»'").getSingleResult();
						etd«et_counter».setDetails(ge«et_counter»);
						etd«et_counter».setUnit("«et.unit»");
						em.persist(etd«et_counter»);
						
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
	
	def compileModules(Collection<Module> modules)'''
		package de.hs_coburg.mgse.persistence.creators;
		
		import de.hs_coburg.mgse.persistence.HibernateUtil;
		import javax.persistence.EntityManager;
		import java.util.ArrayList;
		import java.util.List;
		
		import de.hs_coburg.mgse.persistence.model.Module;
		import de.hs_coburg.mgse.persistence.model.GlossaryEntry;
		import de.hs_coburg.mgse.persistence.model.CourseTypeDeclaration;
		import de.hs_coburg.mgse.persistence.model.ExamType;
		import de.hs_coburg.mgse.persistence.model.ExamTypeDeclaration;
		
		public class ModuleModelCreator {
		    public static boolean createModel() {
		        boolean resp = true;
		        
		        «FOR m: modules»
		        	resp = resp && createModelPart«m_counter++»();
		        «ENDFOR»
		        
		        return resp;
		    }
		
			//«m_counter=0»: Module
			«FOR m: modules»
			private static boolean createModelPart«m_counter++»() {
				try {
					EntityManager em = HibernateUtil.getEntityManager();
					em.getTransaction().begin();
					
					Module m«mp_counter» = new Module();
					m«mp_counter».setCompleteName("«m.name»");
					m«mp_counter».setEcts(«m.ects»);
					m«mp_counter».setQuantifier(Double.parseDouble("«m.quantifier»"));
					m«mp_counter».setSemesterHours(«m.semesterHours»);
					m«mp_counter».setModuleType("«m.moduleType»");
					«IF m.details === null»
						//Abstract Module
						m«mp_counter».setCount(«m.count»);
					«ELSE»
						//Concrete Module
						GlossaryEntry ge«mp_counter» = (GlossaryEntry) em.createQuery("SELECT ge FROM GlossaryEntry ge WHERE ge.abbreviation = '«m.details.information.abbreviation»' AND ge.meaning = '«m.details.information.meaning»' AND ge.word = '«m.details.information.word»'").getSingleResult();
						m«mp_counter».setDetails(ge«mp_counter»);
					«ENDIF»		
					
					//CourseTypeDeclaration
					List<CourseTypeDeclaration> l_ctd«mp_counter» = new ArrayList<CourseTypeDeclaration>();
					«FOR m_: m.courseTypes»
						CourseTypeDeclaration ctd«m_ctd_counter» = (CourseTypeDeclaration) em.createQuery("SELECT ctd FROM CourseTypeDeclaration ctd WHERE ctd.details.abbreviation = '«m_.details.information.abbreviation»' AND ctd.details.meaning = '«m_.details.information.meaning»' AND ctd.details.word = '«m_.details.information.word»'").getSingleResult();
						l_ctd«mp_counter».add(ctd«m_ctd_counter++»);
					«ENDFOR»
					m«mp_counter».setCourseType(l_ctd«mp_counter»);
					
					//ExamType + Relation to ExamTypeDeclaration
					List<ExamType> l_et«mp_counter» = new ArrayList<ExamType>();
					«FOR et: m.examTypes»
					ExamType et«m_et_counter» = new ExamType();
					et«m_et_counter».setLowerBound(«et.lowerBound»);
					et«m_et_counter».setUpperBound(«et.upperBound»);
					ExamTypeDeclaration etd«m_et_counter» = (ExamTypeDeclaration) em.createQuery("SELECT etd FROM ExamTypeDeclaration etd WHERE etd.details.abbreviation = '«et.examTypeDeclaration.details.information.abbreviation»' AND etd.details.meaning = '«et.examTypeDeclaration.details.information.meaning»' AND etd.details.word = '«et.examTypeDeclaration.details.information.word»'").getSingleResult();
					et«m_et_counter».setExamTypeDeclaration(etd«m_et_counter»);
					l_et«mp_counter».add(et«m_et_counter++»);
					«ENDFOR»
					m«mp_counter».setExamTypes(l_et«mp_counter»);
					
					em.persist(m«mp_counter++»);
					
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
	
	def compileSPO(Collection<StudyExaminationRegulations> spos) '''
		package de.hs_coburg.mgse.persistence.creators;
		import de.hs_coburg.mgse.persistence.HibernateUtil;
		import javax.persistence.EntityManager;
		import java.util.ArrayList;
		import java.util.List;
		import java.util.Date;
		import java.util.Calendar;
		import java.util.GregorianCalendar;
		
		import de.hs_coburg.mgse.persistence.model.StudySection;
		import de.hs_coburg.mgse.persistence.model.StudyExaminationRegulations;
		import de.hs_coburg.mgse.persistence.model.Footnote;
		import de.hs_coburg.mgse.persistence.model.Sentence;
		import de.hs_coburg.mgse.persistence.model.Paragraph;
		import de.hs_coburg.mgse.persistence.model.SubParagraph;
		import de.hs_coburg.mgse.persistence.model.CourseOfStudies;
		import de.hs_coburg.mgse.persistence.model.Module;
		
		public class SPOModelCreator {
			public static boolean createModel() {
		        boolean resp = true;
		        
		        «FOR s: spos»
		        	resp = resp && createModelPart«spo_counter++»();
		        «ENDFOR»
		        
		        return resp;
		    }
		
			//«spo_counter=0»: SPO
			«FOR s: spos»
			private static boolean createModelPart«spo_counter++»() {
				try {
					EntityManager em = HibernateUtil.getEntityManager();
					em.getTransaction().begin();
					
					//StudyExaminationRegulations
					StudyExaminationRegulations ser«ser_counter» = new StudyExaminationRegulations();
					CourseOfStudies cos«ser_counter» = (CourseOfStudies) em.createQuery("SELECT cos FROM CourseOfStudies cos WHERE cos.completeName = '«s.course.completeName»' AND cos.ects = «s.course.ects» AND cos.semester = «s.course.semester»").getSingleResult();
					ser«ser_counter».setCourse(cos«ser_counter»);
					ser«ser_counter».setVersion(«s.version»);
					Calendar c«ser_counter» = GregorianCalendar.getInstance();
					c«ser_counter».set(«s.date.year», «s.date.month.value+1», «s.date.day»);  //January 30th 2000
					ser«ser_counter».setValidityDate(new Date(c«ser_counter».getTimeInMillis()));
					ser«ser_counter».setTitle("«s.title.replace('\n','').replace('\t','')»");
					ser«ser_counter».setForeword("«s.foreword.replace('\n','').replace('\t','')»");
					
					//StudySection with Modules
					List<StudySection> l_ss«ser_counter» = new ArrayList<StudySection>();
					«FOR ss: s.studySections»
						StudySection ss«ser_ss_counter» = new StudySection();
						ss«ser_ss_counter».setFirstSemester(«ss.firstSemester»);
						ss«ser_ss_counter».setLastSemester(«ss.lastSemester»);
						ss«ser_ss_counter».setCompleteName("«ss.completeName»");
						List<Module> l_m«ser_ss_counter» = new ArrayList<Module>();
						«FOR m: ss.modules»
							Module m«ser_m_counter» = (Module) em.createQuery("SELECT m FROM Module m WHERE m.completeName = '«m.name»' AND m.ects = «m.ects» AND m.quantifier = «m.quantifier» AND m.semesterHours = «m.semesterHours»").getSingleResult();
							l_m«ser_ss_counter».add(m«ser_m_counter++»);
						«ENDFOR»
						ss«ser_ss_counter».setModules(l_m«ser_ss_counter»);
						l_ss«ser_counter».add(ss«ser_ss_counter++»);
					«ENDFOR»
					ser«ser_counter».setStudySections(l_ss«ser_counter»);
					
					//Footnotes
					List<Footnote> l_fn«ser_counter» = new ArrayList<Footnote>();
					«FOR fn: s.footnotes»
					Footnote fn«fn_counter» = new Footnote();
					fn«fn_counter».setText("«fn.text.replace('\n','').replace('\t','')»");
					l_fn«ser_counter».add(fn«fn_counter++»);
					«ENDFOR»
					ser«ser_counter».setFootnotes(l_fn«ser_counter»);
					
					//Paragraph, SubParagraphs, Sentences and Relation to Footnotes
					List<Paragraph> l_p«ser_counter» = new ArrayList<Paragraph>();
					«FOR p: s.paragraphs»
					Paragraph p«p_counter» = new Paragraph();
					p«p_counter».setTitle("«p.title»");
					p«p_counter».setNumber(«p.number»);
					
					«IF p.sentences !== null»
						//Sentences for Paragraphs
						List<Sentence> l_p_sent«p_counter» = new ArrayList<Sentence>();
						«FOR sent: p.sentences»
							Sentence p_sent«p_sent_counter» = new Sentence();
							p_sent«p_sent_counter».setText("«rtu.getText(sent.text)»");
							
							«IF sent.footnotes.empty === false»
							//Add Relation Paragraph->Sentence to Footnote
							List<Footnote> l_p_sent_fn«p_counter» = new ArrayList<Footnote>();
							for(Footnote fn: l_fn«ser_counter») {
								«FOR fn: sent.footnotes»
									if(fn.getText().equals("«fn.text.replace('\n','').replace('\t','')»")) {
										l_p_sent_fn«p_counter».add(fn);
									}
								«ENDFOR»
							}
							p_sent«p_sent_counter».setFootnotes(l_p_sent_fn«p_counter»);
							«ENDIF»
							
							l_p_sent«p_counter».add(p_sent«p_sent_counter++»);
						«ENDFOR»
						p«p_counter».setSentences(l_p_sent«p_counter»);
					«ENDIF»
					
					List<SubParagraph> l_sp«p_counter» = new ArrayList<SubParagraph>();
					«FOR sp: p.subParagraphs»
						SubParagraph sp«sp_counter» = new SubParagraph();
						sp«sp_counter».setNumber(«sp.number»);
							
						«IF sp.sentences !== null»
							//Sentences for SubParagraphs
							List<Sentence> l_sp_sent«sp_counter» = new ArrayList<Sentence>();
							«FOR sent: sp.sentences»
								Sentence sp_sent«sp_sent_counter» = new Sentence();
								sp_sent«sp_sent_counter».setText("«rtu.getText(sent.text)»");
								
								«IF sent.footnotes.empty === false»
								//Add Relation SubParagraph->Sentence to Footnote
								List<Footnote> l_sp_sent_fn«sp_counter» = new ArrayList<Footnote>();
								for(Footnote fn: l_fn«ser_counter») {
									«FOR fn: sent.footnotes»
										if(fn.getText().equals("«fn.text.replace('\n','').replace('\t','')»")) {
											l_sp_sent_fn«sp_counter».add(fn);
										}
									«ENDFOR»
								}
								sp_sent«sp_sent_counter».setFootnotes(l_sp_sent_fn«sp_counter»);
								«ENDIF»
								
								l_sp_sent«sp_counter».add(sp_sent«sp_sent_counter++»);
							«ENDFOR»
							sp«sp_counter».setSentences(l_sp_sent«sp_counter»);
						«ENDIF»
						
						l_sp«p_counter».add(sp«sp_counter++»);
						«ENDFOR»
					p«p_counter».setSubParagraphs(l_sp«p_counter»);
					l_p«ser_counter».add(p«p_counter++»);
					«ENDFOR»
					ser«ser_counter».setParagraphs(l_p«ser_counter»);
					
					em.persist(ser«ser_counter++»);
					
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
