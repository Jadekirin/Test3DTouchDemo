//
//  AppDelegate.m
//  Test3DTouchDemo
//
//  Created by maweilong-PC on 2017/9/4.
//  Copyright © 2017年 maweilong. All rights reserved.
//

#import "AppDelegate.h"
#import "TestOneViewController.h"
#import "TestTowViewController.h"
#import "SeachViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *Nav = [[UINavigationController alloc] initWithRootViewController:[[TestOneViewController alloc] init]];
    self.window.rootViewController = Nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //设置3D Touch 标签
    NSMutableArray *arrShortcutItem = (NSMutableArray *)[UIApplication sharedApplication].shortcutItems;
    UIApplicationShortcutItem *shoreItem1 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.damon.DM3DTouchDemo.openSeach" localizedTitle:@"搜索" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch] userInfo:nil];
    [arrShortcutItem addObject:shoreItem1];
    UIApplicationShortcutItem *shoreItem2 = [[UIApplicationShortcutItem alloc] initWithType:@"cn.damon.DM3DTouchDemo.openCompose" localizedTitle:@"新消息" localizedSubtitle:@"新消息副标题" icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCompose] userInfo:nil];
    [arrShortcutItem addObject:shoreItem2];
    [UIApplication sharedApplication].shortcutItems = arrShortcutItem;
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{
    //这里可以获的shortcutItem对象的唯一标识符
    //不管APP在后台还是进程被杀死，只要通过主屏快捷操作进来的，都会调用这个方法
    NSLog(@"name:%@\ntype:%@", shortcutItem.localizedTitle, shortcutItem.type);
    UINavigationController *Nav = [[UINavigationController alloc] initWithRootViewController:[[TestOneViewController alloc] init]];
    self.window.rootViewController = Nav;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //判断跳转界面
    
    if ([shortcutItem.type isEqualToString: @"cn.damon.DM3DTouchDemo.openCompose"]) {
        TestTowViewController *TwoVC = [[TestTowViewController alloc] init];
        [Nav pushViewController:TwoVC animated:YES];
    }else if ([shortcutItem.type isEqualToString: @"cn.damon.DM3DTouchDemo.openSeach"]){
        SeachViewController *VC = [[SeachViewController alloc] init];
        [Nav pushViewController:VC animated:YES];
    }else if ([shortcutItem.type isEqualToString: @"com.mycompany.myapp.openfavorites"]){
        SeachViewController *VC = [[SeachViewController alloc] init];
        [Nav pushViewController:VC animated:YES];
    }
    
    
    if (completionHandler) {
        completionHandler(YES);
    }
    
}

@end
