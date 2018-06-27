package de.hs_coburg.mgse.platform.curriculum.utils

import de.hs_coburg.mgse.platform.curriculum.curriculumModel.CurriculumEntry
import de.hs_coburg.mgse.platform.ser.validation.ModuleBehavior

class CurriculumEntryBehavior {
	extension ModuleBehavior = new ModuleBehavior
	
	def getStudySection(CurriculumEntry curriculumEntry){
		return curriculumEntry.moduleSpecification.module.studySection	
	}
	
	
}