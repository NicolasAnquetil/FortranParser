"
A test class for testing the behavior of IREntity
"
Class {
	#name : #IRImport1Test,
	#superclass : #IRAbstractTest,
	#instVars : [
		'mdl',
		'fct'
	],
	#category : #'Fortran_OFP-Tests'
}

{ #category : #tests }
IRImport1Test >> testSetParentFUNCTION [
	| parent child |
	parent := self makeIR: IREntityMODULE key: 'keyMdl'.
	child := self makeIR: IREntityFUNCTION key: 'keyFct'.
	child parentKey: 'keyMdl'.

	child setParentIfNil: irModel.

	self assert: child parentIR equals: parent

]

{ #category : #tests }
IRImport1Test >> testSetParentNAMEREF [
	| parent child |
	parent := self makeIR: IREntityFUNCTION key: 'keyFct'.
	child := self makeIR: IREntityNAMEREF key: 'keyRef'.
	child parentKey: 'keyFct'.

	child setParentIfNil: irModel.

	self assert: child parentIR equals: parent

]

{ #category : #tests }
IRImport1Test >> testSetParentVARIABLE [
	| parent child |
	parent := self makeIR: IREntityFUNCTION key: 'keyFct'.
	child := self makeIR: IREntityVARIABLE key: 'keyVar'.
	child parentKey: 'keyFct'.

	child setParentIfNil: irModel.

	self assert: child parentIR equals: parent

]