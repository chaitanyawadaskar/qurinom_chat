class UserModel {
  UserModel({
    required this.encrypted,
    required this.data,
  });

  final bool? encrypted;
  final Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      encrypted: json["encrypted"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "encrypted": encrypted,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.token,
    required this.user,
  });

  final String? token;
  final User? user;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json["token"],
      user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  User({
    required this.location,
    required this.id,
    required this.name,
    required this.email,
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
    required this.lastSeen,
    required this.profile,
    required this.deletedTime,
    required this.plan,
    required this.previousPlan,
    required this.createdForTtl,
    required this.paymentHistory,
    required this.referralCode,
    required this.planEndDate,
    required this.fcmTokens,
  });

  final Location? location;
  final String? id;
  final String? name;
  final String? email;
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
  final DateTime? lastSeen;
  final String? profile;
  final DateTime? deletedTime;
  final String? plan;
  final String? previousPlan;
  final DateTime? createdForTtl;
  final List<PaymentHistory> paymentHistory;
  final String? referralCode;
  final DateTime? planEndDate;
  final List<String> fcmTokens;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      id: json["_id"],
      name: json["name"],
      email: json["email"],
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
      lastSeen: DateTime.tryParse(json["lastSeen"] ?? ""),
      profile: json["profile"],
      deletedTime: DateTime.tryParse(json["deletedTime"] ?? ""),
      plan: json["plan"],
      previousPlan: json["previousPlan"],
      createdForTtl: DateTime.tryParse(json["createdForTTL"] ?? ""),
      paymentHistory: json["paymentHistory"] == null
          ? []
          : List<PaymentHistory>.from(
              json["paymentHistory"]!.map((x) => PaymentHistory.fromJson(x))),
      referralCode: json["referralCode"],
      planEndDate: DateTime.tryParse(json["planEndDate"] ?? ""),
      fcmTokens: json["fcmTokens"] == null
          ? []
          : List<String>.from(json["fcmTokens"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "name": name,
        "email": email,
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
        "lastSeen": lastSeen?.toIso8601String(),
        "profile": profile,
        "deletedTime": deletedTime?.toIso8601String(),
        "plan": plan,
        "previousPlan": previousPlan,
        "createdForTTL": createdForTtl?.toIso8601String(),
        "paymentHistory": paymentHistory.map((x) => x?.toJson()).toList(),
        "referralCode": referralCode,
        "planEndDate": planEndDate?.toIso8601String(),
        "fcmTokens": fcmTokens.map((x) => x).toList(),
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
  });

  final Upi? upi;

  factory Method.fromJson(Map<String, dynamic> json) {
    return Method(
      upi: json["upi"] == null ? null : Upi.fromJson(json["upi"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "upi": upi?.toJson(),
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
