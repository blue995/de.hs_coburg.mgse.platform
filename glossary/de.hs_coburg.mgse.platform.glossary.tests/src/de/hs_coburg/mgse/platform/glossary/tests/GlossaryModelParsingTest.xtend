/*
 * generated by Xtext 2.12.0
 */
/*package de.hs_coburg.mgse.platform.glossary.tests

import com.google.inject.Inject
import de.hs_coburg.mgse.platform.glossary.glossaryModel.Glossary
import org.eclipse.xtext.testing.InjectWith
import org.eclipse.xtext.testing.XtextRunner
import org.eclipse.xtext.testing.util.ParseHelper
import org.junit.Test
import org.junit.runner.RunWith
import static org.junit.Assert.*

@RunWith(XtextRunner)
@InjectWith(GlossaryModelInjectorProvider)
class GlossaryModelParsingTest {
	@Inject
	ParseHelper<Glossary> parseHelper
	
	@Test
	def void glossaryIsGenerated() {
		val result = parseHelper.parse('''
			Glossar Begriffe
			
			Sektion "Abschlüsse"
				[Master_of_Science]
				Wort: "Master of Science"
				Bedeutung: "Masterabschluss eines naturwissenschaftlichen Studienganges"
				Abkuerzung: "M.Sc."
				
				[Master_of_Arts]
				Wort: "Master of Arts"
				Bedeutung: "Masterabschluss eines geistes-, kultur-, sozial- oder wirtschaftswissenschaftlichen Studienganges"
				Abkuerzung: "M.A."
			Ende
		''')
		assertNotNull(result)
	}
	
	@Test
	def void hasNoErrorsWithSingleEntry() {
		val result = parseHelper.parse('''
			Glossar Begriffe
			
			Sektion "Abschlüsse"
				[Master_of_Science]
				Wort: "Master of Science"
				Bedeutung: "Masterabschluss eines naturwissenschaftlichen Studienganges"
				Abkuerzung: "M.Sc."
			Ende
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void hasNoErrorsWithMultipleEntries() {
		val result = parseHelper.parse('''
			Glossar Begriffe
			
			Sektion "Abschlüsse"
				[Master_of_Science]
				Wort: "Master of Science"
				Bedeutung: "Masterabschluss eines naturwissenschaftlichen Studienganges"
				Abkuerzung: "M.Sc."
				
				[Master_of_Arts]
				Wort: "Master of Arts"
				Bedeutung: "Masterabschluss eines geistes-, kultur-, sozial- oder wirtschaftswissenschaftlichen Studienganges"
				Abkuerzung: "M.A."
			Ende
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void abbreviationIsOptional() {
		val result = parseHelper.parse('''
			Glossar Begriffe
			
			Sektion "Abschlüsse"
				[Master_of_Science]
				Wort: "Master of Science"
				Bedeutung: "Masterabschluss eines naturwissenschaftlichen Studienganges"
			Ende
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void meaningIsOptional() {
		val result = parseHelper.parse('''
			Glossar Begriffe
			
			Sektion "Abschlüsse"
				[Master_of_Science]
				Wort: "Master of Science"
				Abkuerzung: "M.A."
			Ende
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void entriesInSectionAreOptional() {
		val result = parseHelper.parse('''
			Glossar Begriffe
			
			Sektion "Abschlüsse"
				
			Ende
		''')
		assertTrue(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void wordIsRequired() {
		val result = parseHelper.parse('''
			Glossar Begriffe
			
			Sektion "Abschlüsse"
				[Master_of_Science]
				Bedeutung: "Masterabschluss eines naturwissenschaftlichen Studienganges"
				Abkuerzung: "M.A."
			Ende
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void needsAtLeastOneSection() {
		val result = parseHelper.parse('''
			Glossar Begriffe
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void entryIdIsRequired() {
		val result = parseHelper.parse('''
			Glossar Begriffe
			
			Sektion "Abschlüsse"
				Wort: "Master of Science"
				Bedeutung: "Masterabschluss eines naturwissenschaftlichen Studienganges"
				Abkuerzung: "M.A."
			Ende
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void glossarySectionIsRequired() {
		val result = parseHelper.parse('''
		Glossar Begriffe
					
			[Master_of_Science]
			Bedeutung: "Masterabschluss eines naturwissenschaftlichen Studienganges"
			Abkuerzung: "M.A."
		''')
		assertFalse(result.eResource.errors.isEmpty)
	}
	
	@Test
	def void glossaryNameIsRequired() {
		val result = parseHelper.parse('''			
			Sektion "Abschlüsse"
				[Master_of_Science]
				Bedeutung: "Masterabschluss eines naturwissenschaftlichen Studienganges"
				Abkuerzung: "M.A."
			Ende
		''')
		assertNull(result)
	}
}*/
