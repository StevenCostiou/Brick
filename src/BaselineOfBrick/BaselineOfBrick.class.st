Class {
	#name : #BaselineOfBrick,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrick
}

{ #category : #baselines }
BaselineOfBrick >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'Brick-Editor' ]
]
