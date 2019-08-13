// #include "AppDelegate.h"
// #include "GeneratedPluginRegistrant.h"

// @implementation AppDelegate

// - (BOOL)application:(UIApplication *)application
//     didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//   [GeneratedPluginRegistrant registerWithRegistry:self];
//   // Override point for customization after application launch.
//   return [super application:application didFinishLaunchingWithOptions:launchOptions];
// }

// @end
#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
// Add the following import.
#import "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Add the following line, with your API key
  [GMSServices provideAPIKey: @"AIzaSyDlzqpJ-5Q4icnM9I_gKzGHuOF10wbUTGE"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end