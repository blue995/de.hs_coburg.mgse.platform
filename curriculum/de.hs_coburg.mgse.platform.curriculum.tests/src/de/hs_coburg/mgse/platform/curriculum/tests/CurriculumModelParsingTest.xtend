/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.curriculum.tests

import com.google.inject.Inject
import de.hs_coburg.mgse.platform.curriculum.curriculumModel.Model
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Test
import org.junit.runner.RunWith
import static org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(CurriculumModelInjectorProvider)
class CurriculumModelParsingTest {
	@Inject
	ParseHelper<Model> parseHelper
	
	@Test
	def void curriculumIsGenerated() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				Eintrag [E1]
				- Semester 1
				- Turnus jaehrlich
				- Modul SPO_B_IF.Prog1
				- Leistungsnachweis SPO_B_IF.Prog1.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.TB, EIF.JEB
				
				Eintrag [E2]
				- Semester 2
				- Turnus jaehrlich
				- Modul SPO_B_IF.GI
				- Leistungsnachweis SPO_B_IF.GI.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.HS
			]
		''')
		assertNotNull(result)
	}
	
	@Test
	def void hasNoErrorsWithSingleEntry() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				Eintrag [E1]
				- Semester 1
				- Turnus jaehrlich
				- Modul SPO_B_IF.Prog1
				- Leistungsnachweis SPO_B_IF.Prog1.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.TB, EIF.JEB
			]
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void hasNoErrorsWithMultipleEntries() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				Eintrag [E1]
				- Semester 1
				- Turnus jaehrlich
				- Modul SPO_B_IF.Prog1
				- Leistungsnachweis SPO_B_IF.Prog1.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.TB, EIF.JEB
				
				Eintrag [E2]
				- Semester 2
				- Turnus jaehrlich
				- Modul SPO_B_IF.GI
				- Leistungsnachweis SPO_B_IF.GI.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.HS
			]
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void needsAtLeastOneEntry() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void entryNameIsRequired() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				- Semester 1
				- Turnus jaehrlich
				- Modul SPO_B_IF.Prog1
				- Leistungsnachweis SPO_B_IF.Prog1.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.TB, EIF.JEB
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void entrySemesterIsRequired() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				Eintrag [E1]
				- Turnus jaehrlich
				- Modul SPO_B_IF.Prog1
				- Leistungsnachweis SPO_B_IF.Prog1.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.TB, EIF.JEB
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void entryRotaIsRequired() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				Eintrag [E1]
				- Semester 1
				- Modul SPO_B_IF.Prog1
				- Leistungsnachweis SPO_B_IF.Prog1.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.TB, EIF.JEB
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void entryModuleSpecificationIsRequired() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				Eintrag [E1]
				- Semester 1
				- Turnus jaehrlich
				- Leistungsnachweis SPO_B_IF.Prog1.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.TB, EIF.JEB
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void aidListIsOptional() {
		val result = parseHelper.parse('''
			Studienplan [SS_18_IF_B]: "Studienplan für Sommersemester 2018, Informatik Bachelor"
			SPO SPO_B_IF
			Version 1
			Semester Sommersemester 1
			
			Eintraege [
				Eintrag [E1]
				- Semester 1
				- Turnus jaehrlich
				- Modul SPO_B_IF.Prog1
				- Leistungsnachweis SPO_B_IF.Prog1.schrPr (90)
				- Lehrveranstaltungsart Pr, SU
				- Pruefer EIF.TB, EIF.JEB
			]
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void loadAidlist() {
		val result = parseHelper.parse('''
			Hilfsmittel [
				- [nTR]: "Nicht programmierbarer Taschenrechner"
				- [amE]: "Alles mit Einschränkungen"
			]
		''')
		assertNotNull(result)
		assertTrue(result.eResource.errors.isEmpty)
	}
}
