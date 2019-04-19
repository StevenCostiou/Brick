Class {
	#name : #BrStencilDynamicExecutor,
	#superclass : #BrStencilExecutor,
	#instVars : [
		'valuable'
	],
	#category : #'Brick-Editor-Stencil'
}

{ #category : #running }
BrStencilDynamicExecutor >> execute: aCollectionOfArguments [
	self subclassResponsibility
]
