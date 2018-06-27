package de.hs_coburg.mgse.platform.modulehandbook.utils

import de.hs_coburg.mgse.platform.modulehandbook.moduleHandbookModel.ModuleDescription
import de.hs_coburg.mgse.platform.ser.validation.ModuleBehavior

class ModuleDescriptionBehavior {
	extension ModuleBehavior = new ModuleBehavior
	def calculateMaxWorkload(ModuleDescription moduleDescription){
		return moduleDescription.curriculumEntry.moduleSpecification.module.ects * 30
	}
}