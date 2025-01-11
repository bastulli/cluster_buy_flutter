import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/notification_service.dart';

class NotificationTestWidget extends ConsumerStatefulWidget {
  const NotificationTestWidget({super.key});

  @override
  ConsumerState<NotificationTestWidget> createState() =>
      _NotificationTestWidgetState();
}

class _NotificationTestWidgetState
    extends ConsumerState<NotificationTestWidget> {
  bool? _notificationsEnabled;

  @override
  void initState() {
    super.initState();
    _checkNotificationStatus();
  }

  Future<void> _checkNotificationStatus() async {
    final notificationService = ref.read(notificationServiceProvider);
    final status = await notificationService.getNotificationStatus();
    if (mounted) {
      setState(() {
        _notificationsEnabled = status;
      });
    }
  }

  Future<void> _toggleNotifications() async {
    final notificationService = ref.read(notificationServiceProvider);

    if (_notificationsEnabled == true) {
      // Show instructions to disable notifications
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Disable Notifications'),
            content: const Text('To disable notifications:\n\n'
                '1. Click the lock icon in your browser\'s address bar\n'
                '2. Find "Notifications" in the site settings\n'
                '3. Change the permission to "Block"\n\n'
                'This is a browser security feature that prevents websites from programmatically disabling notifications.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      final success = await notificationService.toggleNotifications();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success
                  ? 'Notifications enabled successfully!'
                  : 'Failed to enable notifications. Please check your browser settings.',
            ),
            duration: const Duration(seconds: 3),
          ),
        );
        _checkNotificationStatus(); // Refresh status
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Push Notifications',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Switch(
                  value: _notificationsEnabled ?? false,
                  onChanged: (value) => _toggleNotifications(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _notificationsEnabled == true
                  ? 'Notifications are enabled'
                  : 'Notifications are disabled',
              style: TextStyle(
                color:
                    _notificationsEnabled == true ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
