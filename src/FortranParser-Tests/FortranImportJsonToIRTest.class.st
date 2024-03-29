"
A test class for testing the behavior of IRReader
"
Class {
	#name : #FortranImportJsonToIRTest,
	#superclass : #FortranAbstractTest,
	#category : #'FortranParser-Tests'
}

{ #category : #tests }
FortranImportJsonToIRTest >> testReadFUNCTION [
	self importIR: '{"parent":"whatever","kind":"FUNCTION","data":{"name":"entity2"}}'.
	
	self assert: irModel entities size equals: 1.
	self assert: irModel entities values anyOne kind equals: 'FUNCTION'.
	self assert: irModel entities values anyOne name equals: 'entity2'.

]

{ #category : #tests }
FortranImportJsonToIRTest >> testReadNAMEREF [
	self importIR: '{"parent":"whatever","kind":"NAMEREF","data":{"name":"entity2"}}'.
	
	self assert: irModel entities size equals: 1.
	self assert: irModel entities values anyOne kind equals: 'NAMEREF'.
	self assert: irModel entities values anyOne name equals: 'entity2'.

]

{ #category : #tests }
FortranImportJsonToIRTest >> testReadVARIABLE [
	self importIR: '{"key":"key1","parent":"whatever","kind":"VARIABLE","data":{"anchorstart":123,"isstub":false,"name":"entity2","anchorfile":"aFile.f90","declaredParam":false,"anchorend":456}}'.
	
	self assert: irModel entities size equals: 1.
	self assert: irModel entities values anyOne kind equals: 'VARIABLE'.
	self assert: irModel entities values anyOne name equals: 'entity2'.

]
