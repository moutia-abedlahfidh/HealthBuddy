import 'package:flutter/material.dart';
import 'package:healthbuddy/graphik/graphikscreen.dart';
import 'package:healthbuddy/home/homescreen.dart';
import 'package:healthbuddy/notifications/notificationcontroller.dart';
import 'package:healthbuddy/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {

  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(create: (_)=> NotificationsController(),
      child: Consumer<NotificationsController>(builder: (context, controller, child) {
        return controller.notificationslist.isEmpty
          ? const Center(child: Text("Es gibt keine benachrichtigungen."))
          : ListView.builder(
              itemCount: controller.notificationslist.length,
              itemBuilder: (context, index) {
                final notification = controller.notificationslist[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const Icon(Icons.notifications, color: Colors.blue),
                    title: Text(
                      notification.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(notification.message),
                        const SizedBox(height: 4),
                        Text(
                          notification.dateTime,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
      },),),
    bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          onTap: (index) {
            if (index==3) {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const SettingsScreen()),
        );
            }else if (index == 0) {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  const Homescreen()),
        );
              }else if (index==1) {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GrafikScreen()),
        );
            }else  {

            }
          },
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statistik'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Benachrichtigungen'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Einstellungen'),
          ],
        ),
      ));
  }

  String _formatDate(DateTime dateTime) {
    final now = DateTime.now();
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      // Today
      return "Today, ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}";
    } else {
      return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    }
  }
}
