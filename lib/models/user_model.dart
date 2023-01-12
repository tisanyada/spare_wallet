class UserModel {
  String? id;
  int? pkid;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? avatar;
  String? country;
  bool? isActive;
  bool? isVerified;
  String? accountActivationOtp;
  String? resetPasswordOtp;

  UserModel(
      {this.id,
      this.pkid,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.avatar,
      this.country,
      this.isActive,
      this.isVerified,
      this.accountActivationOtp,
      this.resetPasswordOtp});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    country = json['country'];
    isActive = json['is_active'];
    isVerified = json['is_verified'];
    accountActivationOtp = json['account_activation_otp'];
    resetPasswordOtp = json['reset_password_otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['country'] = this.country;
    data['is_active'] = this.isActive;
    data['is_verified'] = this.isVerified;
    data['account_activation_otp'] = this.accountActivationOtp;
    data['reset_password_otp'] = this.resetPasswordOtp;
    return data;
  }
}
