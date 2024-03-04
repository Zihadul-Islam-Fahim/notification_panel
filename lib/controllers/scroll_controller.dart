import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:notification_panel/controllers/notification_controller.dart';

class ScrollerController extends GetxController {
  final ScrollController scrollController = ScrollController();

  bool loadingNewData = false;

  void onScroll() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels == 0) {
      } else {
        loadingNewData = true;
        Get.find<NotificationController>().incrementSize();
        update();

        Future.delayed(
          const Duration(seconds: 2),
          () {
            loadingNewData = false;
            update();
          },
        );
      }
    }
  }
}
