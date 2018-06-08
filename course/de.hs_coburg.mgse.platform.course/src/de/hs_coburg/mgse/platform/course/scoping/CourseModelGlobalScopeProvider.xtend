package de.hs_coburg.mgse.platform.course.scoping

import com.google.common.base.Predicate
import java.util.LinkedList
import javax.inject.Inject
import org.eclipse.emf.ecore.EReference
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.EcoreUtil2
import org.eclipse.xtext.naming.IQualifiedNameConverter
import org.eclipse.xtext.resource.IContainer
import org.eclipse.xtext.resource.IEObjectDescription
import org.eclipse.xtext.resource.IResourceDescriptions
import org.eclipse.xtext.resource.IResourceServiceProvider
import org.eclipse.xtext.scoping.impl.DefaultGlobalScopeProvider
@Deprecated
class CourseModelGlobalScopeProvider extends DefaultGlobalScopeProvider {
	@Inject IResourceServiceProvider.Registry rspr
	@Inject IQualifiedNameConverter converter
	@Inject IContainer.Manager manager

	def getVisibleResourceUris(Resource resource, IResourceDescriptions index) {
		val descr = index.getResourceDescription(resource.URI)
		val result = new LinkedList
		for (visibleContainer : manager.getVisibleContainers(descr, index)) {
			for (visibleResourceDesc : visibleContainer.resourceDescriptions) {
				result.add(visibleResourceDesc.URI)
			}
		}
		return result
	}

	def getExportedObjects(Resource resource) {
		val resServiceProvider = rspr.getResourceServiceProvider(resource.URI)
		val manager = resServiceProvider.getResourceDescriptionManager()
		val description = manager.getResourceDescription(resource)
		return description.exportedObjects
	}

	def printGlobal(Resource resource) {
		val visibleResources = getVisibleResourceUris(resource, resource.resourceDescriptions)
		for (vr : visibleResources) {
			val resServiceProvider = rspr.getResourceServiceProvider(vr)
			val manager = resServiceProvider.getResourceDescriptionManager()
			val description = manager.getResourceDescription(EcoreUtil2.getResource(resource, vr.toString))
			for (eob : description.exportedObjects) {
				println(eob)
			}
		}

	}

	def printExportedObjects(Resource resource) {
		val exportedObjects = getExportedObjects(resource)
		for (eod : exportedObjects) {
			println(converter.toString(eod.qualifiedName))
		}
	}

	def printVisibleResourceUris(Resource resource, IResourceDescriptions resourceDescriptions) {
		val visibleResourceUris = getVisibleResourceUris(resource, resourceDescriptions)
		for (vru : visibleResourceUris) {
			println(vru)
		}
	}

	override getScope(Resource context, EReference reference, Predicate<IEObjectDescription> filter) {
		printGlobal(context)
		return super.getScope(context, reference, filter)
	}

}
