Class {
	#name : #BrTextEditorOperatorExamples,
	#superclass : #Object,
	#traits : 'TBrTextEditorFixedMeasurerExamples',
	#classTraits : 'TBrTextEditorFixedMeasurerExamples classTrait',
	#category : #'Brick-Editor-Examples - Operators'
}

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> editorOnMultilineText [
	<gtExample>
	| anEditor anEditorElement |
	
	anEditorElement := self editorFor: self multilineText.
	anEditor := anEditorElement editor.
	
	self assert: anEditor cursor isEmpty.	
	self assert: anEditor selection isEmpty.
	
	^ anEditorElement
]

{ #category : #'instance creation' }
BrTextEditorOperatorExamples >> multilineText [
	<gtExample>
	
	^ 'A summer river being crossed
how pleasing
with sandals in my hands!

Light of the moon
Moves west, flowers'' shadows
Creep eastward.

In the moonlight,
The color and scent of the wisteria
Seems far away.' asRopedText
]
