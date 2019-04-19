Class {
	#name : #BaselineOfBrick,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrick
}

{ #category : #baselines }
BaselineOfBrick >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Penfeld'
				with: [ spec
						loads: #('Penfeld-Bloc');
						repository: 'github://plantec/penfeld/src' ].
			spec
				package: 'Brick-Editor'
				with: [ spec requires: 'Penfeld-Bloc' ] ]
]
