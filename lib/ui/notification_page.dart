import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_panel/controllers/notification_controller.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isItemSelected = false;

  bool checkedValue = false;

  List<int> selectedNotifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body:
          GetBuilder<NotificationController>(builder: (notificationController) {
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: notificationController.notificationList.length ?? 0,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                        notificationController.notificationList[index].title ?? ''),
                    subtitle: Text(
                        notificationController.notificationList[index].description ?? ''),
                    value: checkedValue,
                    onChanged: (newValue) {
                      isItemSelected = true;
                      selectedNotifications.add(notificationController.notificationList[index].id!.toInt());
                      setState(() {});
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            ),
            isItemSelected
                ? Container(
                    height: Get.height * 0.1,
                    width: Get.width,
                    color: Colors.grey.shade500,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Select All'),
                          ),
                          Row(
                            children: [
                              OutlinedButton(
                                onPressed: () async {
                                  bool result = await notificationController
                                      .updateNotification(
                                    selectedNotifications,
                                    "Delete",
                                  );
                                  log(result.toString());
                                  if (result) {
                                    Get.snackbar('Deleted',
                                        '${selectedNotifications.length} items Deleted',backgroundColor: Colors.green);
                                  } else {
                                    Get.snackbar(
                                        'Failed ', 'Marked as read Failed',backgroundColor: Colors.red);
                                  }
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.yellow),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              OutlinedButton(
                                onPressed: () async {
                                  final bool result =
                                      await notificationController
                                          .updateNotification(
                                              selectedNotifications, "Read");
                                  log(result.toString());
                                  if (result) {
                                    Get.snackbar('Read As Marked',
                                        '${selectedNotifications.length} items Marked',backgroundColor: Colors.green);
                                  } else {
                                    Get.snackbar(
                                        'Failed ', 'Read As Marked Failed',backgroundColor: Colors.red);
                                  }
                                },
                                child: const Text(
                                  'Mark As Read',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.yellow),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        );
      }),
    );
  }
}
