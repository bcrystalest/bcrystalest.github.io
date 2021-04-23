//
//  FlutterChannelRegistManager.m
//  Runner
//
//  Created by 陈威利 on 2021/3/11.
//

#import "FlutterChannelRegistManager.h"
@implementation FlutterChannelRegistManager
/*FlutterMethodChannel*/
+ (void)registMethodChannelWithApplication:(UIApplication *)application andOptions:(NSDictionary *)launchOptions{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    FlutterViewController* controller = (FlutterViewController*)appDelegate.window.rootViewController;
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel
                                              methodChannelWithName:@"samples.flutter.io/battery"
                                              binaryMessenger:controller];
    
    [messageChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
      if ([@"getBatteryLevel" isEqualToString:call.method]) {
        int batteryLevel = [self getBatteryLevel];
//        if (batteryLevel == -1) {
//          result([FlutterError errorWithCode:@"UNAVAILABLE"
//                                     message:@"Battery info unavailable"
//                                     details:nil]);
//        } else {
          result([NSString stringWithFormat:@"%d",batteryLevel]);
//        }
//          [self showPayData:^(NSString * _Nonnull resultString) {
//              result(resultString);
//          }];
      } else {
        result(FlutterMethodNotImplemented);
      }
    }];
}



+ (void)showPayData:(resultHandler _Nullable)handler{
    handler(@"");
}


+ (int)getBatteryLevel {
    
//  UIDevice* device = UIDevice.currentDevice;
//  device.batteryMonitoringEnabled = YES;
//  if (device.batteryState == UIDeviceBatteryStateUnknown) {
//    return -1;
//  } else {
//    return (int)(device.batteryLevel * 100);
//  }
    return 100;
}


+ (void)sendPayRequestWithResponse:(NSDictionary *)responseDic {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    FlutterViewController* controller = (FlutterViewController*)appDelegate.window.rootViewController;
//    if (responseDic[@"appPayRequest"]) {
//
//    }
}

+ (void)showAlertWithTitle:(NSString *)title {
    if (title.length > 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alert show];
    }
}
@end
