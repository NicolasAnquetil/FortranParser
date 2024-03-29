Extension { #name : #FileReference }

{ #category : #'*FortranParser' }
FileReference >> gtInspectorActionImportFortranIR [
	<gtInspectorAction>
	^ GLMGenericAction new
		action: [ :composite | 
			| result |
			result := IRReader new 
				readFromStream: (StandardFileStream readOnlyFileNamed: self fullName) ;
				yourself.
			composite selection: result ];
		icon: MooseIcons mooseImportMse;
		condition: [ self extension = 'ir' ];
		title: 'Import'
]
