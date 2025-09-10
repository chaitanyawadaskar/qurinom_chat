class ChatModel {
  ChatModel({
    required this.id,
    required this.isGroupChat,
    required this.participants,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.lastMessage,
  });

  final String? id;
  final bool? isGroupChat;
  final List<Participant> participants;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final LastMessage? lastMessage;

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json["_id"],
      isGroupChat: json["isGroupChat"],
      participants: json["participants"] == null
          ? []
          : List<Participant>.from(
              json["participants"]!.map((x) => Participant.fromJson(x))),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      lastMessage: json["lastMessage"] == null
          ? null
          : LastMessage.fromJson(json["lastMessage"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "isGroupChat": isGroupChat,
        "participants": participants.map((x) => x?.toJson()).toList(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "lastMessage": lastMessage?.toJson(),
      };
}

class LastMessage {
  LastMessage({
    required this.id,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.fileUrl,
    required this.createdAt,
  });

  final String? id;
  final String? senderId;
  final String? content;
  final String? messageType;
  final String? fileUrl;
  final DateTime? createdAt;

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      id: json["_id"],
      senderId: json["senderId"],
      content: json["content"],
      messageType: json["messageType"],
      fileUrl: json["fileUrl"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "senderId": senderId,
        "content": content,
        "messageType": messageType,
        "fileUrl": fileUrl,
        "createdAt": createdAt?.toIso8601String(),
      };
}

class Participant {
  Participant({
    required this.location,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.phone,
    required this.addressLane1,
    required this.addressLane2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    required this.isOnline,
    required this.blockedUsers,
    required this.role,
    required this.isVerified,
    required this.isDeleted,
    required this.deletedMessage,
    required this.isDisabled,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.profile,
    required this.lastSeen,
    required this.deletedTime,
    required this.plan,
    required this.createdForTtl,
    required this.paymentHistory,
    required this.previousPlan,
    required this.referralCode,
    required this.planEndDate,
    required this.fcmTokens,
    required this.participantReferralId,
    required this.referralId,
  });

  final Location? location;
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? gender;
  final String? phone;
  final String? addressLane1;
  final String? addressLane2;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;
  final bool? isOnline;
  final List<dynamic> blockedUsers;
  final String? role;
  final bool? isVerified;
  final bool? isDeleted;
  final String? deletedMessage;
  final bool? isDisabled;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? profile;
  final DateTime? lastSeen;
  final DateTime? deletedTime;
  final String? plan;
  final DateTime? createdForTtl;
  final List<PaymentHistory> paymentHistory;
  final String? previousPlan;
  final String? referralCode;
  final DateTime? planEndDate;
  final List<String> fcmTokens;
  final String? participantReferralId;
  final String? referralId;

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      password: json["password"],
      gender: json["gender"],
      phone: json["phone"],
      addressLane1: json["addressLane1"],
      addressLane2: json["addressLane2"],
      city: json["city"],
      state: json["state"],
      postalCode: json["postalCode"],
      country: json["country"],
      isOnline: json["isOnline"],
      blockedUsers: json["blockedUsers"] == null
          ? []
          : List<dynamic>.from(json["blockedUsers"]!.map((x) => x)),
      role: json["role"],
      isVerified: json["isVerified"],
      isDeleted: json["isDeleted"],
      deletedMessage: json["deletedMessage"],
      isDisabled: json["isDisabled"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
      profile: json["profile"],
      lastSeen: DateTime.tryParse(json["lastSeen"] ?? ""),
      deletedTime: DateTime.tryParse(json["deletedTime"] ?? ""),
      plan: json["plan"],
      createdForTtl: DateTime.tryParse(json["createdForTTL"] ?? ""),
      paymentHistory: json["paymentHistory"] == null
          ? []
          : List<PaymentHistory>.from(
              json["paymentHistory"]!.map((x) => PaymentHistory.fromJson(x))),
      previousPlan: json["previousPlan"],
      referralCode: json["referralCode"],
      planEndDate: DateTime.tryParse(json["planEndDate"] ?? ""),
      fcmTokens: json["fcmTokens"] == null
          ? []
          : List<String>.from(json["fcmTokens"]!.map((x) => x)),
      participantReferralId: json["referralId"],
      referralId: json[" referralId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "gender": gender,
        "phone": phone,
        "addressLane1": addressLane1,
        "addressLane2": addressLane2,
        "city": city,
        "state": state,
        "postalCode": postalCode,
        "country": country,
        "isOnline": isOnline,
        "blockedUsers": blockedUsers.map((x) => x).toList(),
        "role": role,
        "isVerified": isVerified,
        "isDeleted": isDeleted,
        "deletedMessage": deletedMessage,
        "isDisabled": isDisabled,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "profile": profile,
        "lastSeen": lastSeen?.toIso8601String(),
        "deletedTime": deletedTime?.toIso8601String(),
        "plan": plan,
        "createdForTTL": createdForTtl?.toIso8601String(),
        "paymentHistory": paymentHistory.map((x) => x?.toJson()).toList(),
        "previousPlan": previousPlan,
        "referralCode": referralCode,
        "planEndDate": planEndDate?.toIso8601String(),
        "fcmTokens": fcmTokens.map((x) => x).toList(),
        "referralId": participantReferralId,
        " referralId": referralId,
      };
}

class Location {
  Location({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class PaymentHistory {
  PaymentHistory({
    required this.orderId,
    required this.amount,
    required this.currency,
    required this.status,
    required this.method,
    required this.paidAt,
    required this.id,
  });

  final String? orderId;
  final int? amount;
  final String? currency;
  final String? status;
  final Method? method;
  final DateTime? paidAt;
  final String? id;

  factory PaymentHistory.fromJson(Map<String, dynamic> json) {
    return PaymentHistory(
      orderId: json["orderId"],
      amount: json["amount"],
      currency: json["currency"],
      status: json["status"],
      method: json["method"] == null ? null : Method.fromJson(json["method"]),
      paidAt: DateTime.tryParse(json["paidAt"] ?? ""),
      id: json["_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "orderId": orderId,
        "amount": amount,
        "currency": currency,
        "status": status,
        "method": method?.toJson(),
        "paidAt": paidAt?.toIso8601String(),
        "_id": id,
      };
}

class Method {
  Method({
    required this.upi,
    required this.card,
  });

  final Upi? upi;
  final Card? card;

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      upi: json["upi"] == null ? null : Upi.fromJson(json["upi"]),
      card: json["card"] == null ? null : Card.fromJson(json["card"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "upi": upi?.toJson(),
        "card": card?.toJson(),
      };
}

class Card {
  Card({
    required this.cardBankName,
    required this.cardCountry,
    required this.cardNetwork,
    required this.cardNetworkReferenceId,
    required this.cardNumber,
    required this.cardSubType,
    required this.cardType,
    required this.channel,
  });

  final String? cardBankName;
  final String? cardCountry;
  final String? cardNetwork;
  final dynamic cardNetworkReferenceId;
  final String? cardNumber;
  final String? cardSubType;
  final String? cardType;
  final String? channel;

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      cardBankName: json["card_bank_name"],
      cardCountry: json["card_country"],
      cardNetwork: json["card_network"],
      cardNetworkReferenceId: json["card_network_reference_id"],
      cardNumber: json["card_number"],
      cardSubType: json["card_sub_type"],
      cardType: json["card_type"],
      channel: json["channel"],
    );
  }

  Map<String, dynamic> toJson() => {
        "card_bank_name": cardBankName,
        "card_country": cardCountry,
        "card_network": cardNetwork,
        "card_network_reference_id": cardNetworkReferenceId,
        "card_number": cardNumber,
        "card_sub_type": cardSubType,
        "card_type": cardType,
        "channel": channel,
      };
}

class Upi {
  Upi({
    required this.channel,
    required this.upiId,
  });

  final String? channel;
  final String? upiId;

  factory Upi.fromJson(Map<String, dynamic> json) {
    return Upi(
      channel: json["channel"],
      upiId: json["upi_id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "channel": channel,
        "upi_id": upiId,
      };
}
