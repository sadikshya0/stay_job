class Users {
  String? status;
  String? message;
  String? token;
  User? user;
  String? dashboard;

  Users({this.status, this.message, this.token, this.user, this.dashboard});

  Users.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    dashboard = json['dashboard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['dashboard'] = this.dashboard;
    return data;
  }
}

class User {
  String? id;
  String? fullName;
  String? phone;
  String? email;
  String? role;
  String? vendorType;
  String? profileImage;
  String? status;
  String? createdAt;

  User({
    this.id,
    this.fullName,
    this.phone,
    this.email,
    this.role,
    this.vendorType,
    this.profileImage,
    this.status,
    this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    email = json['email'];
    role = json['role'];
    vendorType = json['vendor_type'];
    profileImage = json['profile_image'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['role'] = this.role;
    data['vendor_type'] = this.vendorType;
    data['profile_image'] = this.profileImage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
