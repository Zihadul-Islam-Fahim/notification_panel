import 'notification_model.dart';

class GetNotificationModel {
  GetNotificationModel({
    String? status,
    String? message,
    dynamic error,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _error = error;
    _data = data;
  }

  GetNotificationModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _error = json['error'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _status;
  String? _message;
  dynamic _error;
  Data? _data;

  GetNotificationModel copyWith({
    String? status,
    String? message,
    dynamic error,
    Data? data,
  }) =>
      GetNotificationModel(
        status: status ?? _status,
        message: message ?? _message,
        error: error ?? _error,
        data: data ?? _data,
      );

  String? get status => _status;

  String? get message => _message;

  dynamic get error => _error;

  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['error'] = _error;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    num? totalunread,
    List<NotificationModel>? results,
  }) {
    _totalunread = totalunread;
    _results = results;
  }

  Data.fromJson(dynamic json) {
    _totalunread = json['totalunread'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(NotificationModel.fromJson(v));
      });
    }
  }

  num? _totalunread;
  List<NotificationModel>? _results;

  Data copyWith({
    num? totalunread,
    List<NotificationModel>? results,
  }) =>
      Data(
        totalunread: totalunread ?? _totalunread,
        results: results ?? _results,
      );

  num? get totalunread => _totalunread;

  List<NotificationModel>? get notificationList => _results;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['totalunread'] = _totalunread;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
