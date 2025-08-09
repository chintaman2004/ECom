import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final List<Map<String, String>> notifications = const [
    {
      "name": "Kristine Anne",
      "message": "Your recent order #1245 has been shipped!",
      "time": "2 hrs ago",
      "image":
          "https://images.pexels.com/photos/445109/pexels-photo-445109.jpeg",
    },
    {
      "name": "Kray Kikes",
      "message": "New arrivals in our shoe section. Check them out now!",
      "time": "4 hrs ago",
      "image":
          "https://images.pexels.com/photos/837358/pexels-photo-837358.jpeg",
    },
    {
      "name": "Cheryl Maxwell",
      "message": "Reminder: Your wishlist items are on sale!",
      "time": "6 hrs ago",
      "image":
          "https://images.pexels.com/photos/307847/pexels-photo-307847.jpeg",
    },
    {
      "name": "Kray Kikes",
      "message": "Earned 50 points by reviewing a product. Great job!",
      "time": "1 day ago",
      "image":
          "https://images.pexels.com/photos/845457/pexels-photo-845457.jpeg",
    },
    {
      "name": "Kristine Anne",
      "message": "Get 10% off your next purchase. Limited time offer.",
      "time": "2 days ago",
      "image":
          "https://images.pexels.com/photos/247304/pexels-photo-247304.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item['image']!),
            ),
            title: Text(item['name']!),
            subtitle: Text(item['message']!),
            trailing: Text(item['time']!, style: const TextStyle(fontSize: 12)),
            onTap: () {},
          );
        },
      ),
    );
  }
}
