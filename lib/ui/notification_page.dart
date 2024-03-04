import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_panel/controllers/notification_controller.dart';
import 'package:notification_panel/controllers/scroll_controller.dart';
import 'package:notification_panel/ui/widgets/bottom_container.dart';
import 'package:notification_panel/ui/widgets/notification_listtile.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final ScrollerController scrollerController = Get.find<ScrollerController>();


  @override
  @override
  void initState() {
    super.initState();
    scrollerController.scrollController.addListener(scrollerController.onScroll);
  }

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
                child: GetBuilder<ScrollerController>(
                  builder: (_) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(16),
                            controller: scrollerController.scrollController,
                            itemCount: controller.notificationList.length ?? 0,
                            itemBuilder: (context, index) {
                              return notificationListTile(controller, index);
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return const Divider();
                            },
                          ),
                        ),
                        if (scrollerController.loadingNewData) const CircularProgressIndicator(),
                      ],
                    );
                  }
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

  @override
  void dispose() {
    Get.find<NotificationController>().isItemSelected = false;
    Get.find<NotificationController>().selectedIndex = [];
    Get.find<NotificationController>().selectedNotificationsId = [];
    super.dispose();
  }

}
