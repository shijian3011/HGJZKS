//
//  AppDelegate.m
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/4/17.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "AppDelegate.h"
#import "JZNavigationController.h"
#import "JZTabBarController.h"
#import "JZDatabase.h"
#import <EventKit/EventKit.h>

@interface AppDelegate ()

@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic, strong) dispatch_queue_t eventQueue;
@property (nonatomic, assign) NSInteger queueCount;
@property (nonatomic, getter=isRequesting) BOOL request;

@end

@implementation AppDelegate

#pragma mark - AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions");
    self.eventStore = [[EKEventStore alloc] init];
    self.eventQueue = dispatch_queue_create("eventQueue", DISPATCH_QUEUE_SERIAL);
    
    [JZDatabase shareDatabase];
    [self initRootViewController];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
    
    if (self.isRequesting) {
        return;
    }
    
    self.request = YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        self.request = NO;
        [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
            dispatch_async(self.eventQueue, ^{
                
                if (!granted) {
                    return;
                }
                
                if ([UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
                    return;
                }
                
                self.queueCount++;
                
                NSLog(@"///////////////////   %ld   /////////////////////", (long)self.queueCount);
                
                NSCalendar *calendar = [NSCalendar currentCalendar];
                
                
                NSDateComponents *fifteenDays = [[NSDateComponents alloc] init];
                fifteenDays.day = 15;
                
                NSDate *fifteenDaysDate = [calendar dateByAddingComponents:fifteenDays toDate:[NSDate date] options:0];
                
                fifteenDays.day = -10;
                NSDate *tenDaysDate = [calendar dateByAddingComponents:fifteenDays toDate:[NSDate date] options:0];
                
                NSPredicate *pre = [self.eventStore predicateForEventsWithStartDate:tenDaysDate endDate:fifteenDaysDate calendars:[self.eventStore calendarsForEntityType:EKEntityTypeEvent]];
                
                for (EKEvent *event in [self.eventStore eventsMatchingPredicate:pre]) {
                    NSLog(@"pre result is %@, %@, %@", event.title, event.startDate, event.endDate);
                    
                    [self.eventStore removeEvent:event span:EKSpanThisEvent commit:YES error:nil];
                }
                
                NSArray *startDates = @[@"2016-05-15 10:00",@"2016-05-16 10:00",@"2016-05-17 10:00",@"2016-05-18 10:00",@"2016-05-19 10:00",@"2016-05-20 10:00",@"2016-05-21 10:00",@"2016-05-22 10:00",@"2016-05-23 10:00",@"2016-05-24 10:00"];
                NSArray *endDates = @[@"2016-05-15 10:30",@"2016-05-16 10:50",@"2016-05-17 11:00",@"2016-05-18 11:00",@"2016-05-19 11:10",@"2016-05-20 10:55",@"2016-05-21 11:00",@"2016-05-22 10:20",@"2016-05-23 10:35",@"2016-05-24 11:00"];
                
                for (NSInteger index = 0; index < startDates.count; index++) {
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    formatter.dateFormat = @"yyyy-MM-dd hh:mm";
                    
                    NSDate *startDate = [formatter dateFromString:startDates[index]];
                    NSDate *endDate = [formatter dateFromString:endDates[index]];
                    
                    EKEvent *event = [EKEvent eventWithEventStore:self.eventStore];
                    event.calendar = self.eventStore.defaultCalendarForNewEvents;
                    event.startDate = startDate;
                    event.endDate = endDate;
                    event.title = @"韩国驾照考试时间提醒！";
                    
                    [event addAlarm:[EKAlarm alarmWithAbsoluteDate:startDate]];
                    
                    NSError *er;
                    [self.eventStore saveEvent:event span:EKSpanThisEvent commit:YES error:&er];
                    NSLog(@"error is %@", er);
                }
            });
        }];
    });
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");
}

#pragma mark - initRootViewController

- (void)initRootViewController {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    JZTabBarController *tabBarController = [[JZTabBarController alloc] init];
    JZNavigationController *navigationController = [[JZNavigationController alloc] initWithRootViewController:tabBarController];
    self.window.rootViewController = navigationController;
    tabBarController.selectedIndex = 0;
}

@end
