package de.hs_coburg.mgse.platform.ser.validation

import de.hs_coburg.mgse.platform.ser.sERModel.Module
import de.hs_coburg.mgse.platform.ser.sERModel.StudySection

class ModuleBehavior {
	
	def calculateEcts(Module module) {
		
		if (module.isAbstract) {
			return module.ects * module.count
		}
		else
			return module.ects
	}
	
	def isAbstract(Module module) {
		// details --> concrete
		// count --> abstract
		if (module.details === null)
			return true
		else
			return false
	}
	
	def getStudySection(Module module){
		val studySection = module.eContainer as StudySection
		return studySection
	}
}