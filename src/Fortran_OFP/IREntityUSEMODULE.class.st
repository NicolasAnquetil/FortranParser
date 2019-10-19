Class {
	#name : #IREntityUSEMODULE,
	#superclass : #IREntityAssociation,
	#category : 'Fortran_OFP'
}

{ #category : #accessing }
IREntityUSEMODULE >> famixTargetClass [
	^FAMIXModule
]

{ #category : #resolving }
IREntityUSEMODULE >> resolveTarget: aString [
	^parentIR resolveModule: aString
]

{ #category : #converting }
IREntityUSEMODULE >> toFamixSource: famixSource soleTarget: famixTarget [
	^famixSource addUse: famixTarget
]