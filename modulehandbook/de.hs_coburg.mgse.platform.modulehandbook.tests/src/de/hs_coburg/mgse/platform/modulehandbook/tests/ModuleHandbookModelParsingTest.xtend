/*
 * generated by Xtext 2.12.0
 */
/*package de.hs_coburg.mgse.platform.modulehandbook.tests

import com.google.inject.Inject
import de.hs_coburg.mgse.platform.modulehandbook.moduleHandbookModel.Model
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import static org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(ModuleHandbookModelInjectorProvider)
class ModuleHandbookModelParsingTest {
	@Inject
	ParseHelper<Model> parseHelper
	
	@Test
	def void moduleHandbookIsGenerated() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
				
				
				Start		   
				Modul SS_18_IF_B.E2
				Verantwortlicher EIF.HS
				Dozent EIF.HS
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz (Seminaristischer Unterricht: 60 h, Übung: 60 h)"
						Aufwand	90
						
						Beschreibung "Eigenarbeit (Nachbereitung Seminaristischer Unterricht: 40 h, Übung: 30 h, Prüfungsvorbereitung: 50 h)"
						Aufwand	120
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, vom Problem zur Softwarelösung, Konzepte von Programmiersprachen, elementare Algorithmen, übersetzung von Programmiersprachen"
				Medienformen "Tafel", "Skript"
				Literatur "H.-P. Gumm, M. Sommer: Einführung in die Informatik, Oldenbourg Verlag, München / Wien, 10. Auflage, 2012"
				Ende
			]
		''')
		assertNotNull(result)
	}
	
	@Test
	def void moduleHandbookHasNoErrorsWithSingleEntry() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void moduleHandbookHasNoErrorsWithMultipleEntries() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
				
				
				Start		   
				Modul SS_18_IF_B.E2
				Verantwortlicher EIF.HS
				Dozent EIF.HS
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz (Seminaristischer Unterricht: 60 h, Übung: 60 h)"
						Aufwand	90
						
						Beschreibung "Eigenarbeit (Nachbereitung Seminaristischer Unterricht: 40 h, Übung: 30 h, Prüfungsvorbereitung: 50 h)"
						Aufwand	120
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, vom Problem zur Softwarelösung, Konzepte von Programmiersprachen, elementare Algorithmen, übersetzung von Programmiersprachen"
				Medienformen "Tafel", "Skript"
				Literatur "H.-P. Gumm, M. Sommer: Einführung in die Informatik, Oldenbourg Verlag, München / Wien, 10. Auflage, 2012"
				Ende
			]
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void moduleHandbookCurriculumIsRequired() {
		val result = parseHelper.parse('''			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertNull(result)
	}
	
	@Test
	def void moduleHandbookVersionIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void moduleHandbookEntriesIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void moduleHandbookNeedsAtLeastOneEntry() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryModuleIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryResponsiblePersonIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryProfessorIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryLanguageIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryQualificationGoalsIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryWorkloadIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryAdmissionRequirementsIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryContentIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryMediaIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryLiteratureIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryAdmissionRequirementsNeedsAtLeastOne() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryAdmissionReqiurementsTextIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryWorkloadNeedsAtLeastOne() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryMediaNeedsAtLeastOne() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryProfessorNeedsAtLeastOne() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
						Aufwand	60
						
						Beschreibung "Eigenarbeit (30h Vor- und Nachbereitung des Lehrstoffs, 30h Lösung von Übungsaufgaben, 30h Prüfungsvorbereitung)"
						Aufwand	90
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryWorkloadDescriptionIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Aufwand	60
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void mhEntryWorkloadEffortIsRequired() {
		val result = parseHelper.parse('''
			Studienplan SS_18_IF_B
			
			Version 2
			
			Eintraege [
				Start
				Modul SS_18_IF_B.E1
				Verantwortlicher EIF.HS
				Dozent EIF.HS, EIF.JEB, EIF.TB
				Sprache "deutsch"
				Qualifikationsziele "Fachlich-methodische Kompetenzen: Studierende sollen ..."
				Arbeitsaufwand [
						Beschreibung "Präsenz  (30 h Seminaristischer Unterricht, 30 h Übung)"
				]
				Zulassungsvorraussetzungen [
					Vorraussetzung "keine"
				]
				Lerninhalte "Einführung, Datentypen und Ausdrücke, Kontrollstrukturen, Arrays und Zeiger, Prozedurale Programmierung, Rekursion, Objektorientierte Programmierung – Teil 1, Strings, Exception Handling"
				Medienformen "Tafel", "Skript"
				Literatur "Ullenboom, Christian: Java ist auch eine Insel, Galileo Computing jeweils in der neusten Auflage"
				Ende
			]
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
}*/
