class HomeScreenModel {
  Wallet? wallet;

  HomeScreenModel({this.wallet});

  HomeScreenModel.fromJson(Map<String, dynamic> json) {
    wallet =
        json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.wallet != null) {
      data['wallet'] = this.wallet!.toJson();
    }
    return data;
  }
}

class Wallet {
  String? id;
  int? pkid;
  String? walletNumber;
  String? walletBalance;
  int? walletUser;

  Wallet(
      {this.id,
      this.pkid,
      this.walletNumber,
      this.walletBalance,
      this.walletUser});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    walletNumber = json['wallet_number'];
    walletBalance = json['wallet_balance'];
    walletUser = json['wallet_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['wallet_number'] = this.walletNumber;
    data['wallet_balance'] = this.walletBalance;
    data['wallet_user'] = this.walletUser;
    return data;
  }
}
