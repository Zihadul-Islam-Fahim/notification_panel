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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<NotificationController>(
                builder: (notificationController) {
              return ListView.separated(
                itemCount: notificationController.notificationList.length ?? 0,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                        notificationController.notificationList[index].title ??
                            ''),
                    subtitle: Text(notificationController
                            .notificationList[index].description ??
                        ''),
                    value: checkedValue,
                    onChanged: (newValue) {},
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            }),
          ),
          isItemSelected
              ? Container(
                  height: Get.height * 0.1,
                  width: Get.width,
                  color: Colors.green,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
