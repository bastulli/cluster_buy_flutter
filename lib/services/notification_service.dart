import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final notificationServiceProvider = Provider((ref) => NotificationService());

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final supabase = Supabase.instance.client;

  Future<NotificationSettings?> initialize() async {
    try {
      // Check if permission was already granted
      final prefs = await SharedPreferences.getInstance();
      final isPermissionGranted =
          prefs.getBool('notification_permission_granted') ?? false;

      if (!isPermissionGranted) {
        // Request permission for notifications
        NotificationSettings settings =
            await _firebaseMessaging.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );

        if (settings.authorizationStatus == AuthorizationStatus.authorized) {
          await prefs.setBool('notification_permission_granted', true);
        }

        return settings;
      }

      // Initialize local notifications
      const initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const initializationSettingsIOS = DarwinInitializationSettings();
      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsIOS,
      );

      await _localNotifications.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: _onNotificationTapped,
      );

      // Get FCM token
      String? token = await _firebaseMessaging.getToken(
        vapidKey:
            'BMPt1RByZDNcLWL3EsBVRFPNMm6tXquI6v07bj2ww4yE-3K8I4A870v_D1DQnb65DhqgkmnvxmZleyJrFq9BkFk',
      );
      if (token != null) {
        await _updateFcmToken(token);
        print('FCM Token for testing: $token');
      } else {
        print('Failed to get FCM token');
      }

      // Listen for token refresh
      _firebaseMessaging.onTokenRefresh.listen((token) {
        print('FCM Token refreshed: $token');
        _updateFcmToken(token);
      });

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen((message) {
        print('Received foreground message: ${message.messageId}');
        _handleForegroundMessage(message);
      });

      // Handle background/terminated messages
      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);

      // Handle message open
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print('Message opened app: ${message.messageId}');
        _handleMessageOpenedApp(message);
      });

      return null;
    } catch (e) {
      print('Error initializing notifications: $e');
      return null;
    }
  }

  Future<void> _updateFcmToken(String token) async {
    final user = supabase.auth.currentUser;
    if (user != null) {
      // Update the FCM token in your users table or a dedicated tokens table
      await supabase.from('user_push_tokens').upsert({
        'user_id': user.id,
        'token': token,
        'updated_at': DateTime.now().toIso8601String(),
      });
    }
  }

  void _onNotificationTapped(NotificationResponse response) {
    // Handle notification tap
    // You can navigate to specific screens based on the notification payload
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    // Show local notification when app is in foreground
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null) {
      await _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.max,
            priority: Priority.high,
            icon: android?.smallIcon,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: message.data.toString(),
      );

      // Store notification in Supabase if needed
      await _storeNotification(message);
    }
  }

  Future<void> _storeNotification(RemoteMessage message) async {
    final user = supabase.auth.currentUser;
    if (user != null && message.notification != null) {
      await supabase.from('notifications').insert({
        'user_id': user.id,
        'message': message.notification!.body,
        'event_type': message.data['type'] ?? 'general',
        'is_read': false,
        'created_at': DateTime.now().toIso8601String(),
      });
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    // Handle notification tap when app was in background
    // Navigate to appropriate screen based on message data
  }
}

// This needs to be a top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Handle background messages
  // This function will be called when the app is in the background or terminated
  print('Handling background message: ${message.messageId}');
}
