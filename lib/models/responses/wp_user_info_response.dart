import 'package:collection/collection.dart' show IterableExtension;

class WPUserInfoResponse {
  bool? success;
  int? statusCode;
  String? code;
  String? message;
  Data? data;

  WPUserInfoResponse({
    this.success,
    this.statusCode,
    this.code,
    this.message,
    this.data,
  });

  WPUserInfoResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null && json['data'] != null && json['data'] != {}
        ? new Data.fromJson(json['data'])
        : null;
    success = json['success'] ?? false;
    statusCode = json['statusCode'] ?? -1;
    code = json['code'] ?? null;
    message = json['message'] ?? 'Error retrieving message';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['statusCode'] = this.statusCode;
    data['code'] = this.code;
    data['success'] = this.success;
    return data;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? userNicename;
  String? displayName;
  String? userStatus;
  String? email;
  String? avatar;
  List<MetaData>? metaData;
  List<String>? roles;
  String? createdAt;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.userNicename,
      this.displayName,
      this.roles,
      this.userStatus,
      this.email,
      this.avatar,
      this.metaData,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    userNicename = json['user_nicename'];
    displayName = json['display_name'];
    userStatus = json['user_status'];
    email = json['email'];
    roles = [];
    if (json['roles'] != null) {
      (json['roles'] as List).forEach((role) {
        roles!.add(role);
      });
    }
    avatar = json['avatar'];
    if (json['meta_data'] != null && Map.of(json['meta_data']).isNotEmpty) {
      this.metaData = [];
      Map.from(json['meta_data']).forEach((key, value) {
        this.metaData!.add(MetaData.fromJson(key, value));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['user_nicename'] = this.userNicename;
    data['display_name'] = this.displayName;
    data['user_status'] = this.userStatus;
    data['email'] = this.email;
    data['roles'] = (this.roles ?? []).map((e) => e).toList();
    data['avatar'] = this.avatar;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData!.map((e) => e.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    return data;
  }

  /// Returns an array of meta data from a WP MetaData [key]
  ///
  /// Returns List<dynamic>
  List<dynamic>? getMetaDataArrayWhere(String key) {
    MetaData? metaData = this.metaData!.firstWhereOrNull((e) => e.key == key);
    if (metaData == null || metaData.value == null) {
      return null;
    }
    return metaData.value;
  }

  /// Returns a single meta data value from a WP MetaData [key]
  ///
  /// Returns dynamic
  dynamic getMetaDataFirstWhere(String key) {
    MetaData? metaData = this.metaData!.firstWhereOrNull((e) => e.key == key);
    if (metaData == null ||
        metaData.value == null ||
        metaData.value!.length < 1) {
      return null;
    }
    return metaData.value!.first;
  }
}

class MetaData {
  String? key;
  List<dynamic>? value;

  MetaData({this.key, this.value});

  MetaData.fromJson(String key, List<dynamic> value) {
    this.key = key;
    this.value = value;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, List<dynamic>?> data =
        new Map<String?, List<dynamic>?>();
    if (key != null) {
      data[key] = this.value;
    }
    return data;
  }
}
