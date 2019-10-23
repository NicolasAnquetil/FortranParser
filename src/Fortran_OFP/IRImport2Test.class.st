Class {
	#name : #IRImport2Test,
	#superclass : #IRAbstractTest,
	#instVars : [
		'mdl',
		'fct'
	],
	#category : #'Fortran_OFP-Tests'
}

{ #category : #tests }
IRImport2Test >> testToFamixFUNCTION [
	| ir fmx |
	ir := self makeIR: IREntityFUNCTION key: 'keyFct'.
	ir name: 'fct'.

	fmx := ir toFamix.
	self assert: fmx class equals: FamixFortranFunction.
	self assert: fmx name equals: 'fct'.
]

{ #category : #tests }
IRImport2Test >> testToFamixMODULE [
	| ir fmx |
	ir := self makeIR: IREntityMODULE key: 'keyMdl'.
	ir name: 'mdl'.

	fmx := ir toFamix.

	self assert: fmx class equals: FamixFortranModule.
	self assert: fmx name equals: 'mdl'.

]

{ #category : #tests }
IRImport2Test >> testToFamixVARIABLE_localToFunction [
	| ir fmx |
	ir := self makeIR: IREntityVARIABLE key: 'keyVar'.
	ir name: 'var'.
	ir parentIR: (self makeIR: IREntityFUNCTION key: 'keyFct').

	fmx := ir toFamix.

	self assert: fmx class equals: FamixFortranLocalVariable.
	self assert: fmx name equals: 'var'.

]

{ #category : #tests }
IRImport2Test >> testToFamixVARIABLE_localToModule [
	| ir fmx |
	ir := self makeIR: IREntityVARIABLE key: 'keyVar'.
	ir name: 'var'.
	ir parentIR: (self makeIR: IREntityMODULE key: 'keyMdl').

	fmx := ir toFamix.

	self assert: fmx class equals: FamixFortranGlobalVariable.
	self assert: fmx name equals: 'var'.

]

{ #category : #tests }
IRImport2Test >> testToFamixVARIABLE_localToNothing [
	| ir fmx |
	ir := self makeIR: IREntityVARIABLE key: 'keyVar'.
	ir name: 'var'.
	ir parentIR: irModel.  "default parentIR when none is specified"

	fmx := ir toFamix.

	self assert: fmx class equals: FamixFortranLocalVariable.
	self assert: fmx name equals: 'var'.

]