import 'package:flutter_audio_app/model/song_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  void initialize() {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    _notificationsPlugin.initialize(initializationSettings);
  }

  void showNotification(Song song) {
    const notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        'audio_channel',
        'Audio Playback',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    _notificationsPlugin.show(
      0,
      song.title,
      'Playing audio',
      notificationDetails,
    );
  }
}
