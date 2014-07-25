"Redefine non-label accessors (they have to be matched because match cannot
"override keyword)
syn clear cppAccess
syn clear cUserCont
syn match	cppPublic				"\(\s\+\|:\)public\s\+"
syn match	cppPrivate				"\(\s\+\|:\)private\s\+"
syn match	cppProtected			"\(\s\+\|:\)protected\s\+"

hi def link cppPublic				cppAccess
hi def link cppPrivate				cppAccess
hi def link cppProtected			cppAccess

"Highlight whole class accessor label including the indents for visibility
syn match	cppPublicLabel			"\s*public:"
syn match	cppPrivateLabel			"\s*private:"
syn match	cppProtectedLabel		"\s*protected:"
syn match	qtSignalsLabel			"\s*signals:"
syn match	qtSlotsLabel			"\s*slots:"
syn match	qtPublicSlotsLabel		"\s*public slots:"
syn match	qtPrivateSlotsLabel		"\s*private slots:"
syn match	qtProtectedSlotsLabel	"\s*protected slots:"

hi def link cppPublicLabel			cppAccessLabels
hi def link cppPrivateLabel			cppAccessLabels
hi def link cppProtectedLabel		cppAccessLabels
hi def link qtSignalsLabel			cppAccessLabels
hi def link qtSlotsLabel			cppAccessLabels
hi def link qtPublicSlotsLabel		cppAccessLabels
hi def link qtPrivateSlotsLabel		cppAccessLabels
hi def link qtProtectedSlotsLabel	cppAccessLabels

