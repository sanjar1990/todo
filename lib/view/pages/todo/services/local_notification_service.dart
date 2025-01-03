import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class NotificationService {
  NotificationService(){
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(tz.local.name));
  }
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static final onClickNotification=BehaviorSubject<String>();

  static void onNotificationTap(NotificationResponse notificationResponse){
    onClickNotification.add(notificationResponse.payload!);
  }

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@drawable/notification_ic.png');
    var iosInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,

      // onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) =>  Get.log('FCM initInfo iOS : ID - $id'),
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iosInitializationSettings,
    );
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap
    );
  }

  notificationDetails() {
    return NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max, priority: Priority.high, ticker: 'Ticker',icon: '@drawable/notification_ic.png'),
        iOS: DarwinNotificationDetails()
    );
  }
  sceduleNotificationDetails() {
    return NotificationDetails(
        android: AndroidNotificationDetails('channelId two', 'channelName two',
            channelDescription: 'your channel description',
            importance: Importance.max, priority: Priority.high,icon: '@drawable/notification_ic.png'),
        iOS: DarwinNotificationDetails()
    );
  }


  Future scheduleNotification(
      {int id = 3, String? title, String? body, String? payload,
        required DateTime schedule}) async {
    print('NOTIFICATION>>>'
        'YEAR::${schedule.year}'
        'Mont::${schedule.month}'
        'day::${schedule.day}'
        'HOUR::${schedule.hour}'
        'Minut::${schedule.minute}');
    print('LOCAL:::${tz.local.name}');
    return notificationsPlugin.zonedSchedule(id, title, body,
        tz.TZDateTime.from(schedule,tz.local),
        await sceduleNotificationDetails(),
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.exact,
        payload: payload
    );
  }
}
