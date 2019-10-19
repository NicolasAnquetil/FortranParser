Class {
	#name : #IREntitySUBPRGCALL,
	#superclass : #IREntityAssociation,
	#category : 'Fortran_OFP'
}

{ #category : #accessing }
IREntitySUBPRGCALL >> famixTargetClass [
	^FAMIXFunction
]

{ #category : #resolving }
IREntitySUBPRGCALL >> resolveTarget: aString [
	^parentIR resolveFunction: aString
]

{ #category : #converting }
IREntitySUBPRGCALL >> toFamixSource: famixSource soleTarget: famixTarget [
	"not used because #toFamixSource:targets accepts multiple targets"
	self shouldNotImplement 
]

{ #category : #converting }
IREntitySUBPRGCALL >> toFamixSource: famixSource targets: famixTargets [

	^FAMIXInvocation new
			signature: (data at: 'name') ;
			sender: famixSource ;
			candidates: famixTargets ;
			mooseModel: self mooseModel ;
			yourself.
]