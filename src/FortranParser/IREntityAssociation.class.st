Class {
	#name : #IREntityAssociation,
	#superclass : #IREntity,
	#category : #'FortranParser-IRModel'
}

{ #category : #converting }
IREntityAssociation >> createStub: stubClass named: aString [
	^stubClass new
		name: aString ;
		isStub: true ;
		mooseModel: self mooseModel
		yourself
]

{ #category : #converting }
IREntityAssociation >> errorTooManyResolvedFor: aName [
	(IRNameResolutionException new
		messageText: aName , ' resolved to more than one entity')
		signal
]

{ #category : #accessing }
IREntityAssociation >> famixClass [
	self shouldNotImplement 
]

{ #category : #accessing }
IREntityAssociation >> famixTargetClass [
	self subclassResponsibility 
]

{ #category : #testing }
IREntityAssociation >> isAnonymous [
	"optimization because associations should always be anonymous"
	^true
]

{ #category : #testing }
IREntityAssociation >> isNamed: aString [
	^false
]

{ #category : #printing }
IREntityAssociation >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' ->' ;
		nextPutAll: self targetName.
]

{ #category : #resolving }
IREntityAssociation >> resolveFunction: aString [
	^parentIR resolveFunction: aString
]

{ #category : #resolving }
IREntityAssociation >> resolveReference: aString [
	^parentIR resolveReference: aString
]

{ #category : #resolving }
IREntityAssociation >> resolveTarget: aString [
	self subclassResponsibility 
]

{ #category : #resolving }
IREntityAssociation >> resolveVariable: aString [
	^parentIR resolveVariable: aString
]

{ #category : #accessing }
IREntityAssociation >> targetName [
	^data at: 'name'
]

{ #category : #converting }
IREntityAssociation >> toFamix [
	| src tgts |
	src := parentIR famix.
	src ifNil: [ ^ self ].

	tgts := self resolveTarget: self targetName.
	(tgts isNil or: [tgts isEmpty]) ifTrue: [ ^ self ].

	^ self toFamixSource: src targets: tgts
]

{ #category : #converting }
IREntityAssociation >> toFamixSource: famixSource soleTarget: famixTarget [
	self subclassResponsibility 
]

{ #category : #converting }
IREntityAssociation >> toFamixSource: famixSource targets: famixTargets [
	"by default assumes there should be exactly one target
		if too many, raise an exception ; if not enough, create a stub"

	famixTargets size > 1
		ifTrue: [ self errorTooManyResolvedFor: self targetName ].

	^ self
		toFamixSource: famixSource
		soleTarget:
			(famixTargets
				ifEmpty: [ self createStub: self famixTargetClass named: self targetName ]
				ifNotEmpty: [ :array | array anyOne ])
]
