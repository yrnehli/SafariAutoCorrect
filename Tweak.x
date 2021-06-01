#import "Tweak.h"

static BOOL enabledAutoCorrect = NO;
static id navigationBarTextField;

%hook UIFieldEditor
- (id)initWithTextField:(id)arg1 {
	if ([arg1 isKindOfClass:NSClassFromString(@"UnifiedField")]) {
		navigationBarTextField = arg1;
	}

	return %orig;
}
%end

%hook UITextField
- (id)text {
	if (!enabledAutoCorrect && self == navigationBarTextField) {
		[[self textInputTraits] setAutocorrectionType:2];
		enabledAutoCorrect = YES;
	}
	
	return %orig;
}
%end