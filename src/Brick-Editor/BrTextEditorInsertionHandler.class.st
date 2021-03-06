"
I handle keystroke-based insertions and must be added to the editor element
"
Class {
	#name : #BrTextEditorInsertionHandler,
	#superclass : #BlElementEventListener,
	#category : #'Brick-Editor-UI - Handlers'
}

{ #category : #'api - insertion' }
BrTextEditorInsertionHandler >> insert: aString atCursorIn: anEditor [
	anEditor inserter
		atCursor;
		string: aString;
		insert
]

{ #category : #'keyboard handlers' }
BrTextEditorInsertionHandler >> keystrokeEvent: anEvent [
	| aCharacter |

	aCharacter := anEvent char.
	
	((Unicode isPrintable: aCharacter) or: [ aCharacter isSeparator ])
		ifFalse: [ ^ self ].
	
	"we don't want to insert anything if primary modifier key is pressed.
	without this check if users try to use shortcuts that may don't exist such as (meta+s) the action will result in typing
	which lead to unwanted effects"
	(anEvent modifiers isPrimaryModifier)
		ifTrue: [ ^ self ].

	anEvent consumed: true.

	self
		insert: anEvent char asString
		atCursorIn: anEvent currentTarget editor
]

{ #category : #'keyboard handlers' }
BrTextEditorInsertionHandler >> textInputEvent: anEvent [
    "we don't want to insert anything if primary modifier key is pressed.
    without this check if users try to use shortcuts that may don't exist such as (meta+s) the action will result in typing
    which lead to unwanted effects"
    (anEvent modifiers isPrimaryModifier)
        ifTrue: [ ^ self ].

    anEvent consumed: true.

    self
        insert: anEvent text asString
        atCursorIn: anEvent currentTarget editor
]
