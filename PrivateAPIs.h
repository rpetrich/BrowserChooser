#import <UIKit/UIKit.h>

// Foundation

@interface NSURL (iOS3)
- (BOOL)isWebcalURL;
- (NSURL *)mapsURL;
- (NSURL *)youTubeURL;
@end

@interface NSURL (iOS5)
- (BOOL)isStoreServicesURL;
- (BOOL)gamecenterURL;
- (BOOL)appleStoreURL;
@end

// UIKit

extern UIApplication *UIApp;

@interface UIActionSheet (OS32)
- (id)addMediaButtonWithTitle:(NSString *)title iconView:(UIImageView *)imageView andTableIconView:(UIImageView *)imageView;
@end

@interface UIWindow ()
- (void)_updateToInterfaceOrientation:(UIInterfaceOrientation)orientation animated:(BOOL)animated;
@end

@interface UIWebClip : NSObject
- (NSURL *)pageURL;
@end

// SpringBoard

@interface SpringBoard : UIApplication
- (UIInterfaceOrientation)_frontMostAppOrientation;
- (void)applicationOpenURL:(NSURL *)url publicURLsOnly:(BOOL)publicURLsOnly;
@end

@interface SpringBoard (iOS5)
- (void)applicationOpenURL:(NSURL *)url publicURLsOnly:(BOOL)publicURLsOnly animating:(BOOL)animating sender:(id)sender additionalActivationFlag:(unsigned)additionalActivationFlag;
@end

@interface SpringBoard (iOS6)
- (void)applicationOpenURL:(NSURL *)url withApplication:(id)application sender:(id)sender publicURLsOnly:(BOOL)publicURLsOnly animating:(BOOL)animating needsPermission:(BOOL)needsPermission additionalActivationFlags:(id)flags;
@end

@interface SpringBoard (iOS7)
- (void)_applicationOpenURL:(NSURL *)url withApplication:(id)application sender:(id)sender publicURLsOnly:(BOOL)publicOnly animating:(BOOL)animating additionalActivationFlags:(id)activationFlags activationHandler:(id)activationHandler;
- (void)applicationOpenURL:(id)url withApplication:(id)application sender:(id)sender publicURLsOnly:(BOOL)only animating:(BOOL)animating needsPermission:(BOOL)permission additionalActivationFlags:(id)flags activationHandler:(id)handler;
@end

@interface SpringBoard (iOS8)
- (void)applicationOpenURL:(NSURL *)arg1 withApplication:(id)application sender:(id)sender publicURLsOnly:(BOOL)publicOnly animating:(BOOL)animating needsPermission:(BOOL)needsPermission activationSettings:(id)activationSettings withResult:(id)resultHandler;
@end

@interface SBApplication : NSObject
- (NSString *)displayIdentifier;
@end

@interface SBApplication (iOS8)
- (NSString *)bundleIdentifier;
@end

@interface SBApplicationController : NSObject
+ (id)sharedInstance;
- (SBApplication *)applicationWithDisplayIdentifier:(NSString *)displayIdentifier;
@end

@interface SBApplicationController (iOS8)
- (SBApplication *)applicationWithBundleIdentifier:(NSString *)bundleIdentifier;
@end

@interface SBBookmarkIcon : NSObject // Not actually
- (UIWebClip *)webClip;
@end
