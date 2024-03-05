/********* NotificationsConfigurationPlugin.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface NotificationService () <NSURLSessionDelegate>
@property(nonatomic) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property(nonatomic) UNMutableNotificationContent *bestAttemptContent;
@end

@implementation NotificationsConfigurationPlugin

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];

    // Modify the notification content here as you wish
    self.bestAttemptContent.title = [NSString stringWithFormat:@"%@ [modified]",
    self.bestAttemptContent.title];

  // Call FIRMessaging extension helper API.
  [[FIRMessaging extensionHelper] populateNotificationContent:self.bestAttemptContent
                                            withContentHandler:contentHandler];

}

@end
