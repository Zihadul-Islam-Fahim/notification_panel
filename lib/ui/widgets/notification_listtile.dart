import 'package:flutter/material.dart';
import 'package:notification_panel/controllers/notification_controller.dart';

CheckboxListTile notificationListTile(
    NotificationController controller, int index) {
  return CheckboxListTile(
    title: Text(controller.notificationList[index].title ?? ''),
    subtitle: Text(controller.notificationList[index].description ?? ''),
    value: controller.selectedIndex.contains(index) ? true : false,
    onChanged: (newValue) {
      controller.itemSelected(
          index, controller.notificationList[index].id!.toInt());
    },
    controlAffinity: ListTileControlAffinity.leading,
  );
}
