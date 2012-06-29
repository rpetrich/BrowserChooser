#import <SpringBoard/SpringBoard.h>
#import <AppList/ALApplicationList.h>

@interface NSURL (iOS5)
- (BOOL)isStoreServicesURL;
- (BOOL)gamecenterURL;
- (BOOL)appleStoreURL;
@end

static NSDictionary *schemeMapping;

static inline NSString *BCActiveDisplayIdentifier(void)
{
	return [[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.rpetrich.browserchooser.plist"] objectForKey:@"BCActiveDisplayIdentifier"];
}

static inline NSString *BCReplaceSafariWordInText(NSString *text)
{
	if (text && [text rangeOfString:@"Safari"].location != NSNotFound) {
		NSString *displayIdentifier = BCActiveDisplayIdentifier();
		if ([displayIdentifier length]) {
			NSString *newAppName = [[ALApplicationList sharedApplicationList].applications objectForKey:displayIdentifier];
			if ([newAppName length]) {
				return [text stringByReplacingOccurrencesOfString:@"Safari" withString:newAppName];
			}
		}
	}
	return text;
}

%hook SpringBoard

- (void)applicationOpenURL:(NSURL *)url publicURLsOnly:(BOOL)only animating:(BOOL)animating sender:(id)sender additionalActivationFlag:(unsigned)flag
{
	if (![url isStoreServicesURL] && ![url isWebcalURL] && ![url mapsURL] && ![url youTubeURL] && ![url gamecenterURL] && ![url appleStoreURL]) {
		NSDictionary *identifierMapping = [schemeMapping objectForKey:BCActiveDisplayIdentifier()];
		if (identifierMapping) {
			NSString *oldScheme = [url.scheme lowercaseString];
			NSString *newScheme = [identifierMapping objectForKey:oldScheme];
			if (newScheme)
				url = [NSURL URLWithString:[newScheme stringByAppendingString:[url.absoluteString substringFromIndex:oldScheme.length]]];
		}
	}
	%orig;
}

%end

%hook UIActionSheet

- (void)addButtonWithTitle:(NSString *)title
{
	%orig(BCReplaceSafariWordInText(title));
}

%end

%hook UIAlertView

- (void)addButtonWithTitle:(NSString *)title
{
	%orig(BCReplaceSafariWordInText(title));
}

%end

%ctor
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	schemeMapping = [[NSDictionary alloc] initWithContentsOfFile:@"/Library/Application Support/BrowserChooser/mapping.plist"];
	%init;
	[pool drain];
}
