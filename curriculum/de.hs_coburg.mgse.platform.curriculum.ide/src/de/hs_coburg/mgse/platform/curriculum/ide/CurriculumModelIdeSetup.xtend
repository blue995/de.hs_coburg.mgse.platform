/*
 * generated by Xtext 2.12.0
 */
package de.hs_coburg.mgse.platform.curriculum.ide

import com.google.inject.Guice
import de.hs_coburg.mgse.platform.curriculum.CurriculumModelRuntimeModule
import de.hs_coburg.mgse.platform.curriculum.CurriculumModelStandaloneSetup
import org.eclipse.xtext.util.Modules2

/**
 * Initialization support for running Xtext languages as language servers.
 */
class CurriculumModelIdeSetup extends CurriculumModelStandaloneSetup {

	override createInjector() {
		Guice.createInjector(Modules2.mixin(new CurriculumModelRuntimeModule, new CurriculumModelIdeModule))
	}
	
}
