tests-converting
testToFamixMODULE
	|entity|
	entity := self makeEntity: {'name' -> 'entity2' . 'kind' -> 'MODULE' } key: 'keyMdl2'.

	self assert: entity toFamix class equals: FAMIXModule.
	self assert: entity toFamix parentScope equals: nil.