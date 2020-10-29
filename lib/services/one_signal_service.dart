import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static initializeOneSignal() {
    OneSignal.shared.init("1d4d027b-73b3-4af0-8381-87a4a6d06a27", iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: false
    });
    OneSignal.shared
        .setInFocusDisplayType(OSNotificationDisplayType.notification);
  }

  // call this function to schedule notification when an user registers for an event
  // parameters required: event name<String>, event date<DateTime>, hoursBefore<int>
  // will have to modify the function to accept event map once event registration is working

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
