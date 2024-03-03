import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_panel/controllers/notification_controller.dart';
import 'package:notification_panel/ui/widgets/bottom_container.dart';
import 'package:notification_panel/ui/widgets/notification_listtile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: controller.notificationList.length ?? 0,
                  itemBuilder: (context, index) {
                    return notificationListTile(controller, index);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                ),
              ),
              controller.isItemSelected
                  ? bottomContainer(controller)
                  : const SizedBox()
            ],
          );
        },
      ),
    );
  }
}
