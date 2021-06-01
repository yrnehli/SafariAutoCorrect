#import "Tweak.h"

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
	if (self == navigationBarTextField) {
		[[self textInputTraits] setAutocorrectionType:2];
	}
	
	return %orig;
}
%end