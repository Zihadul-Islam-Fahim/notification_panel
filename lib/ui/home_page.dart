import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:notification_panel/controllers/notification_controller.dart';
import 'package:notification_panel/ui/notification_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    Get.find<NotificationController>().getNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey,
          height: Get.height*0.07,
          padding: EdgeInsets.all(20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GetBuilder<NotificationController>(
                  builder: (notificationController) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const NotificationPage());
                      },
                      child: SizedBox(
                        child: badges.Badge(
                          badgeContent:
                              Text(notificationController.getNotificationModel.data?.totalunread.toString() ?? "0"),
                          child: const Icon(Icons.notifications,size: 32,),
                        ),
                      ),
                    );
                  }
                )
              ],
            ),
        ),
      ),

    );
  }
}
