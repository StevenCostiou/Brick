instance creation
openExample3_4: anObject
	| space editor |
	space := BlSpace new
		extent: (500.0@440);
		title: 'Moldable editor'.
	
	editor := BrEditorElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		margin: (BlInsets top: 10 right: 5 bottom: 10 left: 10);
		yourself.
		
	editor editor subject: anObject.
	
	space root layout: BlLinearLayout horizontal.
	space root addChild: editor.
	space root addEventHandler:
			(BlEventHandler
				on: BlDblClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	space show.
	
	space root forceLayout.
	space root asSpartaForm writePNGFileNamed: 'two_other_code_regions.png'