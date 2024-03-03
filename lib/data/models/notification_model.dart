class NotificationModel {
  NotificationModel({
    num? id,
    num? userId,
    dynamic image,
    String? title,
    String? description,
    String? readStatus,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,}){
    _id = id;
    _userId = userId;
    _image = image;
    _title = title;
    _description = description;
    _readStatus = readStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
  }

  NotificationModel.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _image = json['image'];
    _title = json['title'];
    _description = json['description'];
    _readStatus = json['read_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
  }
  num? _id;
  num? _userId;
  dynamic _image;
  String? _title;
  String? _description;
  String? _readStatus;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  NotificationModel copyWith({  num? id,
    num? userId,
    dynamic image,
    String? title,
    String? description,
    String? readStatus,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) => NotificationModel(  id: id ?? _id,
    userId: userId ?? _userId,
    image: image ?? _image,
    title: title ?? _title,
    description: description ?? _description,
    readStatus: readStatus ?? _readStatus,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    deletedAt: deletedAt ?? _deletedAt,
  );
  num? get id => _id;
  num? get userId => _userId;
  dynamic get image => _image;
  String? get title => _title;
  String? get description => _description;
  String? get readStatus => _readStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['image'] = _image;
    map['title'] = _title;
    map['description'] = _description;
    map['read_status'] = _readStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    return map;
  }

}