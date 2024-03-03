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
        ElevatedButton(
          onPressed: () {
            controller.selectAll(controller.notificationList.length);
          },
          child: const Text(
            'Select All',

          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: () async {
                bool result = await controller.updateNotification(
                  controller.selectedNotificationsId,
                  "Delete",
                );

                if (result) {
                  Get.snackbar('Deleted',
                      'Selected items Deleted',
                      backgroundColor: Colors.green);
                } else {
                  Get.snackbar('Failed ', 'Marked as read Failed',
                      backgroundColor: Colors.red);
                }
              },
              child: const Text(
                'Delete',
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
              onPressed: () async {
                final bool result = await controller.updateNotification(
                    controller.selectedNotificationsId, "Read");
                if (result) {
                  Get.snackbar('Read As Marked',
                      'Selected items Marked',
                      backgroundColor: Colors.green);
                } else {
                  Get.snackbar('Failed ', 'Read As Marked Failed',
                      backgroundColor: Colors.red);
                }
              },
              child: const Text(
                'Mark As Read',

              ),
            ),
          ],
        ),
      ],
    ),
  );
}
