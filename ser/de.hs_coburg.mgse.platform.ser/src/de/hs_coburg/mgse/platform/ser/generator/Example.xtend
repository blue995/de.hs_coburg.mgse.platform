package de.hs_coburg.mgse.platform.ser.generator

import de.hs_coburg.mgse.platform.ser.sERModel.RichText
import de.hs_coburg.mgse.platform.ser.utils.RichTextUtils

class Example {
	extension RichTextUtils = new RichTextUtils
	
	/**
	 * 1) Import RichTextUtils as extension
	 * 2) ".text" will be available, which calls the method "getText()" of RichTextUtils
	 * 3) This will convert a RichText to String
	 */
	def generateThisRichTextStuff(RichText richText){
		val rtAsString = richText.text
		return rtAsString
	}
}