import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;
import 'package:flutter/material.dart';

final notificationServiceProvider = Provider((ref) => NotificationService());

// Global key for accessing navigator state
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();
  final supabase = Supabase.instance.client;

  Future<bool> getNotificationStatus() async {
    try {
      if (html.Notification.permission == 'granted') {
        return true;
      }
      return false;
    } catch (e) {
      print('Error checking notification status: $e');
      return false;
    }
  }

  Future<bool> toggleNotifications() async {
    try {
      final currentStatus = await getNotificationStatus();
      if (currentStatus) {
        // Can't programmatically revoke permissions, show instructions
        return true; // Return true since notifications are enabled
      } else {
        // Request both FCM and browser permissions
        final fcmSettings = await _firebaseMessaging.requestPermission(
          alert: true,
          badge: true,
          sound: true,
          provisional: false,
        );

        if (fcmSettings.authorizationStatus == AuthorizationStatus.authorized) {
          // Initialize if permissions granted
          await initialize();
          return true;
        }
      }
      return false;
    } catch (e) {
      print('Error toggling notifications: $e');
      return false;
    }
  }

  Future<NotificationSettings?> initialize() async {
    try {
      // Always request permission for web
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      print('User granted permission: ${settings.authorizationStatus}');

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
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        print('Received foreground message: ${message.messageId}');

        // For web, we need to show notification manually in foreground
        if (message.notification != null) {
          // Request permission again to ensure it's granted
          final permission = await html.Notification.requestPermission();

          if (permission == 'granted') {
            // Show notification using the Web Notifications API
            html.Notification(
              message.notification!.title ?? 'New Message',
              body: message.notification!.body,
              icon: '/icons/Icon-192.png',
            );
          }
        }

        _handleForegroundMessage(message);
      });

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
    final notification = message.notification;

    if (notification != null) {
      // Store notification in Supabase
      await _storeNotification(message);

      // Show dialog if we have a valid navigator context
      if (navigatorKey.currentContext != null) {
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => AlertDialog(
            title: Text(notification.title ?? 'New Message'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.body ?? ''),
                if (message.data.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  const Text('Additional Information:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  ...message.data.entries
                      .map((entry) => Text('${entry.key}: ${entry.value}')),
                ],
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      } else {
        // Fallback to web notification if dialog can't be shown
        final permission = await html.Notification.requestPermission();
        if (permission == 'granted') {
          html.Notification(
            notification.title ?? 'New Message',
            body: notification.body,
            icon: '/icons/Icon-192.png',
          );
        }
      }
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
