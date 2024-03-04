import 'package:get/get.dart';
import 'package:notification_panel/controllers/notification_controller.dart';
import 'package:notification_panel/controllers/scroll_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
    Get.put(ScrollerController());
  }
}
