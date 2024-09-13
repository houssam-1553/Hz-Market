// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationManager {
//   static const NotificationDetails platformChannelSpecifics =
//       NotificationDetails(
//     android: AndroidNotificationDetails(
//       'your_channel_id', // Replace with your channel ID
//       'Channel Name',
//       channelDescription: 'alpha',
//       importance: Importance.max,
//       priority: Priority.high,
//     ),
//   );

//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static void initialize() {
//     // Initialization  setting for android
//     const InitializationSettings initializationSettingsAndroid =
//         InitializationSettings(
//       android: AndroidInitializationSettings(
//         "@mipmap/ic_launcher",
//       ),
//     );
//     _notificationsPlugin.initialize(
//       initializationSettingsAndroid,
//       // to handle event when we receive notification
//       onDidReceiveNotificationResponse: (details) {
//         if (details.input != null) {}
//       },
//     );
//   }

//   static Future<void> display({String? title}) async {
//     // To display the notification in device
//     try {
//       await _notificationsPlugin.show(
//         1,
//         title ?? 'title',
//         'bdy',
//         const NotificationDetails(
//             android: AndroidNotificationDetails(
//           'channelId',
//           'channelName',

//           // priority: Priority.max,
//           // importance: Importance.max,
//           // fullScreenIntent: true,
//           // actions: <AndroidNotificationAction>[
//           //   AndroidNotificationAction('id_1', 'Action 1'),
//           //   AndroidNotificationAction('id_2', 'Action 2'),
//           //   AndroidNotificationAction('id_3', 'Action 3'),
//           // ],
//         )),
//         payload: 'route]',
//       );
//     } catch (e) {
//       print(e);
//     }
//   }
// }
