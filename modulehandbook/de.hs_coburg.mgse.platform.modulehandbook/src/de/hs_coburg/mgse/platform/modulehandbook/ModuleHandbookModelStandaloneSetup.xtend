/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.modulehandbook


/**
 * Initialization support for running Xtext languages without Equinox extension registry.
 */
class ModuleHandbookModelStandaloneSetup extends ModuleHandbookModelStandaloneSetupGenerated {

	def static void doSetup() {
		new ModuleHandbookModelStandaloneSetup().createInjectorAndDoEMFRegistration()
	}
}
