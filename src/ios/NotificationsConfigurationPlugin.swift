/********* NotificationsConfigurationPlugin.m Cordova Plugin Implementation *******/

//#import <Cordova/CDV.h>


class NotificationsConfigurationPlugin {

    func didReceiveNotificationRequest(request:UNNotificationRequest!, withContentHandler contentHandler:(UNNotificationContent)->Void) {
        self.contentHandler = contentHandler
        self.bestAttemptContent = request.content.mutableCopy()

        // Modify the notification content here as you wish
        self.bestAttemptContent.title = String(format:"%@ [modified]",
        self.bestAttemptContent.title)

      // Call FIRMessaging extension helper API.
      FIRMessaging.extensionHelper().populateNotificationContent(self.bestAttemptContent,
                                                withContentHandler:contentHandler)

    }
}
