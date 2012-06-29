#import <SpringBoard/SpringBoard.h>

@interface NSURL (iOS5)
- (BOOL)isStoreServicesURL;
- (BOOL)gamecenterURL;
- (BOOL)appleStoreURL;
@end

static NSDictionary *schemeMapping;

%hook SpringBoard

- (void)applicationOpenURL:(NSURL *)url publicURLsOnly:(BOOL)only animating:(BOOL)animating sender:(id)sender additionalActivationFlag:(unsigned)flag
{
	if (![url isStoreServicesURL] && ![url isWebcalURL] && ![url mapsURL] && ![url youTubeURL] && ![url gamecenterURL] && ![url appleStoreURL]) {
		NSString *activeDisplayIdentifier = [[NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.rpetrich.browserchooser.plist"] objectForKey:@"BCActiveDisplayIdentifier"];
		NSDictionary *identifierMapping = [schemeMapping objectForKey:activeDisplayIdentifier];
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

%ctor
{
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	schemeMapping = [[NSDictionary alloc] initWithContentsOfFile:@"/Library/Application Support/BrowserChooser/mapping.plist"];
	%init;
	[pool drain];
}
