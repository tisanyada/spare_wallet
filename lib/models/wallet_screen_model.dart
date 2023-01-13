class WalletScreenModel {
  List<Debitcards>? debitcards;

  WalletScreenModel({this.debitcards});

  WalletScreenModel.fromJson(Map<String, dynamic> json) {
    if (json['debitcards'] != null) {
      debitcards = <Debitcards>[];
      json['debitcards'].forEach((v) {
        debitcards!.add(new Debitcards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.debitcards != null) {
      data['debitcards'] = this.debitcards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Debitcards {
  String? id;
  int? pkid;
  String? cardName;
  String? cardNumber;
  String? cardType;
  String? cardExpiration;
  int? cardUser;

  Debitcards(
      {this.id,
      this.pkid,
      this.cardName,
      this.cardNumber,
      this.cardType,
      this.cardExpiration,
      this.cardUser});

  Debitcards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pkid = json['pkid'];
    cardName = json['card_name'];
    cardNumber = json['card_number'];
    cardType = json['card_type'];
    cardExpiration = json['card_expiration'];
    cardUser = json['card_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pkid'] = this.pkid;
    data['card_name'] = this.cardName;
    data['card_number'] = this.cardNumber;
    data['card_type'] = this.cardType;
    data['card_expiration'] = this.cardExpiration;
    data['card_user'] = this.cardUser;
    return data;
  }
}
