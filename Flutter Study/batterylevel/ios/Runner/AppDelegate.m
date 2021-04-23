#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "FlutterChannelRegistManager.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    
    [FlutterChannelRegistManager registMethodChannelWithApplication:application andOptions:launchOptions];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}



@end
