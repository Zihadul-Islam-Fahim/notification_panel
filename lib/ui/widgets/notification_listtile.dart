import 'package:flutter/material.dart';
import 'package:notification_panel/controllers/notification_controller.dart';

ListTile notificationListTile(NotificationController controller, int index) {
  return ListTile(
    title: Text(controller.notificationList[index].title ?? ''),
    subtitle: Text(controller.notificationList[index].description ?? ''),
    trailing: controller.notificationList[index].readStatus == 'Yes' ? const Icon(Icons.mark_email_unread) : null,
    onTap: () {
      controller.itemSelected(
        index,
        controller.notificationList[index].id!.toInt(),
      );
    },
    leading: controller.isItemSelected
        ? Checkbox(
            value: controller.selectedIndex.contains(index) ? true : false,
            onChanged: (bool? value) {
              controller.itemSelected(
                index,
                controller.notificationList[index].id!.toInt(),
              );
            },
          )
        : null,
  );
}
