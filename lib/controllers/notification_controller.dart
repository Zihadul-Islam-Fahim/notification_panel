import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:http/http.dart' as http;
import 'package:notification_panel/data/models/get_notification_model.dart';
import 'package:notification_panel/data/models/network_response.dart';
import 'package:notification_panel/data/models/notification_model.dart';
import 'package:notification_panel/data/services/network_caller.dart';
import 'package:notification_panel/data/utilities/urls.dart';

class NotificationController extends GetxController {
  int size = 10;

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

  incrementSize() {
    size += 10;
    update();
  }
}
