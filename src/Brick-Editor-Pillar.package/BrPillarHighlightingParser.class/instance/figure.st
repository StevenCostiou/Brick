parsers
figure
	^ super figure 
	==> [ :tokens | 
		| attribute pictureFileReference fileNameWithoutPrefix |
				
		fileNameWithoutPrefix := tokens third.
		(fileNameWithoutPrefix beginsWith: 'file://') ifTrue: [ 
			fileNameWithoutPrefix := fileNameWithoutPrefix copyFrom: 'file://' size + 1 to: fileNameWithoutPrefix size ].
		pictureFileReference := self fileReference parent resolveString: fileNameWithoutPrefix.
		attribute := pictureFileReference exists
			ifTrue: [ 
				"make sure that file is a picture"
				(pictureFileReference isFile
					and: [ pictureFileReference mimeTypes notNil
						and: [ pictureFileReference mimeTypes first matches: ZnMimeType imagePng ] ])
					ifTrue: [
						| previewAttribute anImageForm |
						anImageForm := pictureFileReference binaryReadStreamDo: [ :stream | 
							PNGReadWriter formFromStream: stream ].
						previewAttribute := BrTextExpandButtonAttribute new attributesCreatingBlock: [
							BrPillarPictureAttribute image: anImageForm ].
						self targetText 
							attributes: { previewAttribute }
							from: tokens first start 
							to: tokens last stop ].
						
				self targetText 
					attributes: { BrTextForegroundAttribute paint: Color blue muchDarker }
					from: tokens first start 
					to: tokens last stop.
				]
			ifFalse: [ 
				self targetText 
					attributes: {  BrTextForegroundAttribute paint: Color red }
					from: tokens first start 
					to: tokens last stop.
				] ]