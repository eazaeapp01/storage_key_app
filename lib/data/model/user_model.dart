class UserModel {
  User? user;
  bool? status;
  String? message;
  String? token;

  UserModel({this.user, this.status, this.message, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    status = json['status'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? avatar;
  String? phone;
  String? address;
  String? userType;
  String? status;
  String? isDeleted;
  String? lastLoginAt;
  String? createdBy;
  String? statusId;
  String? invitationToken;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? isInEmployee;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.avatar,
        this.phone,
        this.address,
        this.userType,
        this.status,
        this.isDeleted,
        this.lastLoginAt,
        this.createdBy,
        this.statusId,
        this.invitationToken,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.isInEmployee});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    avatar = json['avatar'];
    phone = json['phone'];
    address = json['address'];
    userType = json['user_type'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    lastLoginAt = json['last_login_at'];
    createdBy = json['created_by'];
    statusId = json['status_id'];
    invitationToken = json['invitation_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isInEmployee = json['is_in_employee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['avatar'] = avatar;
    data['phone'] = phone;
    data['address'] = address;
    data['user_type'] = userType;
    data['status'] = status;
    data['is_deleted'] = isDeleted;
    data['last_login_at'] = lastLoginAt;
    data['created_by'] = createdBy;
    data['status_id'] = statusId;
    data['invitation_token'] = invitationToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['is_in_employee'] = isInEmployee;
    return data;
  }
}
