generated
scanForTokenX12
	self recordMatch: #(16).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	^ self reportLastMatch