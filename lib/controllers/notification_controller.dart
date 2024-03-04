import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:notification_panel/data/models/get_notification_model.dart';
import 'package:notification_panel/data/models/network_response.dart';
import 'package:notification_panel/data/models/notification_model.dart';
import 'package:notification_panel/data/services/network_caller.dart';
import 'package:notification_panel/data/utilities/urls.dart';

class NotificationController extends GetxController {
  int size = 10;
  bool isItemSelected = false;

  bool checkedValue = false;

  bool allSelected = false;

  List<int> selectedNotificationsId = [];

  List<int> selectedIndex = [];

  GetNotificationModel _getNotificationModel = GetNotificationModel();

  GetNotificationModel get getNotificationModel => _getNotificationModel;

  List<NotificationModel> _notificationList = [];

  List<NotificationModel> get notificationList => _notificationList;

  Future<bool> getNotification() async {
    NetworkResponse networkResponse =
        await NetworkCaller().getRequest(Urls.getNotification(size));
    if (networkResponse.isSuccess) {
      _getNotificationModel =
          GetNotificationModel.fromJson(networkResponse.responseData);
      _notificationList = _getNotificationModel.data?.notificationList ?? [];
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateNotification(List<int> id, String status) async {
    Map<String, dynamic> inputParams = {
      "notification_Ids": id,
      "status": status
    };
    NetworkResponse networkResponse = await NetworkCaller()
        .postRequest(Urls.updateNotification, body: inputParams);
    if (networkResponse.isSuccess) {
      return true;
    } else {
      return false;
    }
  }

  itemSelected(index, id) {
    isItemSelected = true;
    selectedIndex.contains(index)
        ? selectedIndex.remove(index)
        : selectedIndex.add(index);
    selectedIndex = selectedIndex.toSet().toList();
    selectedNotificationsId.add(id);
    selectedNotificationsId = selectedNotificationsId.toSet().toList();
    update();
  }

  selectAll(length) {
    if (allSelected) {
      selectedIndex = [];
      allSelected = false;
    } else {
      for (int i = 0; i < length; i++) {
        selectedIndex.add(i);
      }
      selectedIndex = selectedIndex.toSet().toList();
      allSelected = true;
    }

    update();
  }

  incrementSize() {
    size += 10;
    getNotification();
    update();
  }
}
