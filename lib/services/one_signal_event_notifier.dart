import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static initializeOneSignal() {
    OneSignal.shared.init("7e36b485-1ee9-41c1-a6d9-d00e4b14b63f", iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: false
    });
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
  }

  // call this function to schedule notification when an user registers for an event
  // parameters required: event name<String>, event date<DateTime>, hoursBefore<int>

  static scheduleNotification(
      String eventName, DateTime eventDate, int hoursBefore) async {
    var status = await OneSignal.shared.getPermissionSubscriptionState();
    var playerId = status.subscriptionStatus.userId;
    OneSignal.shared.postNotification(
      OSCreateNotification(
        playerIds: [playerId],
        heading: eventName,
        content: "Event starts in 4 hours!",
        sendAfter: eventDate.subtract(Duration(hours: hoursBefore)),
      ),
    );
  }
}
