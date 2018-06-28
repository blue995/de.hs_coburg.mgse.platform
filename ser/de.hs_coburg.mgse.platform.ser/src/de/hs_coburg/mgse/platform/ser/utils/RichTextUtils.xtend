package de.hs_coburg.mgse.platform.ser.utils

import de.hs_coburg.mgse.platform.ser.sERModel.RichText
import de.hs_coburg.mgse.platform.ser.sERModel.RichTextReference
import de.hs_coburg.mgse.platform.ser.sERModel.RichTextString
import java.util.LinkedList

class RichTextUtils {
	def getText(RichText text){
		val literals = text.literals
		val result = new LinkedList
		
		for (literal : literals) {
			switch literal {
				RichTextString: result.add(literal.text)
				RichTextReference: result.add(literal.reference.information.abbreviation)
			}
		}
		val ret = String.join(' ', result).replace('\n', '')
		return ret
	}
}