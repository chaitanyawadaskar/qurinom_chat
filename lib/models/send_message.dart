class SendMessageModel {
  SendMessageModel({
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.fileUrl,
    required this.deletedBy,
    required this.status,
    required this.deliveredAt,
    required this.seenAt,
    required this.seenBy,
    required this.id,
    required this.reactions,
    required this.sentAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? chatId;
  final String? senderId;
  final String? content;
  final String? messageType;
  final String? fileUrl;
  final List<dynamic> deletedBy;
  final String? status;
  final dynamic deliveredAt;
  final dynamic seenAt;
  final List<dynamic> seenBy;
  final String? id;
  final List<dynamic> reactions;
  final DateTime? sentAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      chatId: json["chatId"],
      senderId: json["senderId"],
      content: json["content"],
      messageType: json["messageType"],
      fileUrl: json["fileUrl"],
      deletedBy: json["deletedBy"] == null
          ? []
          : List<dynamic>.from(json["deletedBy"]!.map((x) => x)),
      status: json["status"],
      deliveredAt: json["deliveredAt"],
      seenAt: json["seenAt"],
      seenBy: json["seenBy"] == null
          ? []
          : List<dynamic>.from(json["seenBy"]!.map((x) => x)),
      id: json["_id"],
      reactions: json["reactions"] == null
          ? []
          : List<dynamic>.from(json["reactions"]!.map((x) => x)),
      sentAt: DateTime.tryParse(json["sentAt"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "chatId": chatId,
        "senderId": senderId,
        "content": content,
        "messageType": messageType,
        "fileUrl": fileUrl,
        "deletedBy": deletedBy.map((x) => x).toList(),
        "status": status,
        "deliveredAt": deliveredAt,
        "seenAt": seenAt,
        "seenBy": seenBy.map((x) => x).toList(),
        "_id": id,
        "reactions": reactions.map((x) => x).toList(),
        "sentAt": sentAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
