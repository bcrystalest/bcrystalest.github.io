//
//  FlutterChannelRegistManager.h
//  Runner
//
//  Created by 陈威利 on 2021/3/11.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface FlutterChannelRegistManager : NSObject

typedef void (^resultHandler)(NSString *resultString);

+ (void)registMethodChannelWithApplication:(UIApplication *)application andOptions:(NSDictionary *)launchOptions;
@end

NS_ASSUME_NONNULL_END
