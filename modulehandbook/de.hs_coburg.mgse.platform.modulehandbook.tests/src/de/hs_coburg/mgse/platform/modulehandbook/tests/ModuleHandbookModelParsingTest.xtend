/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.modulehandbook.tests

import com.google.inject.Inject
import de.hs_coburg.mgse.platform.modulehandbook.moduleHandbookModel.Model
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Assert
import org.junit.Test
import org.junit.runner.RunWith

@RunWith(XtextRunner)
@InjectWith(ModuleHandbookModelInjectorProvider)
class ModuleHandbookModelParsingTest {
	@Inject
	ParseHelper<Model> parseHelper
	
	@Test
	def void loadModuleHandbook() {
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
		Assert.assertNotNull(result)
		Assert.assertTrue(result.eResource.errors.isEmpty)
	}
}
