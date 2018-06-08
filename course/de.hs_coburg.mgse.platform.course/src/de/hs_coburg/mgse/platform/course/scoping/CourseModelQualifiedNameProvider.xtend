package de.hs_coburg.mgse.platform.course.scoping

import com.google.inject.Inject
import de.hs_coburg.mgse.platform.course.courseModel.CourseModelPackage
import de.hs_coburg.mgse.platform.course.courseModel.Professor
import de.hs_coburg.mgse.platform.glossary.glossaryModel.GlossaryEntry
import de.hs_coburg.mgse.platform.glossary.glossaryModel.GlossaryModelPackage
import org.eclipse.xtext.naming.DefaultDeclarativeQualifiedNameProvider
import org.eclipse.xtext.naming.IQualifiedNameConverter
import org.eclipse.xtext.naming.QualifiedName
import org.eclipse.xtext.nodemodel.util.NodeModelUtils

@Deprecated
class CourseModelQualifiedNameProvider extends DefaultDeclarativeQualifiedNameProvider {

//	@Inject IQualifiedNameConverter qnc
//
//	def QualifiedName qualifiedName(Professor p) {
//		val l = NodeModelUtils.findNodesForFeature(p, CourseModelPackage.Literals.PROFESSOR__ABBREVIATION)
//		println(l.size)
//		println(l.head.grammarElement)
//		println(l.head.asTreeIterable)
//		println(l.head.text)
//		println(l.head.text.trim)
//		val ls = NodeModelUtils.findActualSemanticObjectFor(l.head)
//		println(ls)
//		// val abbr = qnc.toQualifiedName(p.abbreviation.information.abbreviation)
//		val fullName = qnc.toQualifiedName(p.firstName + '_' + p.lastName)
//		println("hello jude")
//		return fullName
//	}
//
//	def QualifiedName qualifiedName(GlossaryEntry ge) {
//		val l = NodeModelUtils.findNodesForFeature(ge,
//			GlossaryModelPackage.Literals.GLOSSARY_ENTRY_INFORMATION__ABBREVIATION)
//		println(l.size)
//		println(l.head.grammarElement)
//		println(l.head.asTreeIterable)
//		println(l.head.text)
//		println(l.head.text.trim)
//		val ls = NodeModelUtils.findActualSemanticObjectFor(l.head)
//		println(ls)
//		// val abbr = qnc.toQualifiedName(p.abbreviation.information.abbreviation)
//		val fullName = qnc.toQualifiedName(l.head.text.trim)
//		println("hello jude")
//		return fullName
//	}

}
