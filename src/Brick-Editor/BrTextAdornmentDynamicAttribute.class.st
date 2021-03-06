"
I am a dynamic version of an adornment attribute that creates visual text adornments with the help of a provided stencil (builder).

I work together with ==BrTextAdornmentStencilBuilder== to build a corresponding stencil for a text adornment.
Users should create a subclass of ==BrTextAdornmentStencilBuilder== and override ==#buildDefault== that returns a new instance of an intended stencil or a new visual element (==BlElement==).

Once stencil builder is created it can be attached to the attribute as follows:
[[[
	BrTextAdornmentDynamicAttribute new
		stencil: BrTextAdornmentStencilBuilder new
]]]

For scripting purposes a block closure can be used instead. It can have two optional parameters:
 - a piece of text to be affected
 - and and instance of an editor element to get access to the editor model if it needs to be invalidated due to some user actions (for example trigger syntax highlighter to restyle a text)

[[[
	BrTextAdornmentDynamicAttribute new
		stencil: [ :aBlText :aBrEditorElement |  BlElement new ""or BrStencil that creates elements"" ]
]]]
"
Class {
	#name : #BrTextAdornmentDynamicAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#instVars : [
		'stencilBuilder'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextAdornmentDynamicAttribute >> affect: aBlText in: anEditorElement [
	<return: #BlElement>

	^ stencilBuilder
		text: aBlText;
		editor: anEditorElement;
		asElement
]

{ #category : #accessing }
BrTextAdornmentDynamicAttribute >> stencil: anAdornmentStencilBuilder [
	stencilBuilder := anAdornmentStencilBuilder asStencilBuilder: BrTextAdornmentStencilBuilder
]
