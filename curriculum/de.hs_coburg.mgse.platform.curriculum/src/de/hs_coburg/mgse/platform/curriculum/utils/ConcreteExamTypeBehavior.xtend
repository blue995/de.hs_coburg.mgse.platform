package de.hs_coburg.mgse.platform.curriculum.utils

import de.hs_coburg.mgse.platform.curriculum.curriculumModel.ConcreteExamType
import de.hs_coburg.mgse.platform.curriculum.curriculumModel.ModuleSpecification

class ConcreteExamTypeBehavior {
	def getModuleSpecification(ConcreteExamType concreteExamType){
		val spec = concreteExamType.eContainer as ModuleSpecification
		return spec
	}
	def getModule(ConcreteExamType examType){
		val spec = examType.moduleSpecification
		val module = spec.module
		return module
	}
}