/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.glossary

/**
 * Initialization support for running Xtext languages without Equinox extension registry.
 */
class GlossaryModelStandaloneSetup extends GlossaryModelStandaloneSetupGenerated {

	def static void doSetup() {
		new GlossaryModelStandaloneSetup().createInjectorAndDoEMFRegistration()
	}
}
