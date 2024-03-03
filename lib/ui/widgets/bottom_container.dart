import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_panel/controllers/notification_controller.dart';

Container bottomContainer(NotificationController controller) {
  return Container(
    height: Get.height * 0.1,
    width: Get.width,
    color: Colors.grey.shade500,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () {
            controller.selectAll(controller.notificationList.length);
          },
          child: const Text(
            'Select All',
            style: TextStyle(fontSize: 14, color: Colors.yellow),
          ),
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: () async {
                bool result = await controller.updateNotification(
                  controller.selectedNotificationsId,
                  "Delete",
                );

                if (result) {
                  Get.snackbar('Deleted',
                      '${controller.selectedNotificationsId.length} items Deleted',
                      backgroundColor: Colors.green);
                } else {
                  Get.snackbar('Failed ', 'Marked as read Failed',
                      backgroundColor: Colors.red);
                }
              },
              child: const Text(
                'Delete',
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            OutlinedButton(
              onPressed: () async {
                final bool result = await controller.updateNotification(
                    controller.selectedNotificationsId, "Read");
                if (result) {
                  Get.snackbar('Read As Marked',
                      '${controller.selectedNotificationsId.length} items Marked',
                      backgroundColor: Colors.green);
                } else {
                  Get.snackbar('Failed ', 'Read As Marked Failed',
                      backgroundColor: Colors.red);
                }
              },
              child: const Text(
                'Mark As Read',
                style: TextStyle(fontSize: 14, color: Colors.yellow),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
