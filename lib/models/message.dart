class MessageModel {
  final String id;
  final String chatId;
  final String senderId;
  final String content;
  final String messageType;
  final List<String> deletedBy;
  final String status;
  final DateTime? deliveredAt;
  final DateTime? seenAt;
  final List<String> seenBy;
  final List<String> reactions;
  final DateTime sentAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.content,
    required this.messageType,
    required this.deletedBy,
    required this.status,
    this.deliveredAt,
    this.seenAt,
    required this.seenBy,
    required this.reactions,
    required this.sentAt,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'] as String,
      chatId: json['chatId'] as String,
      senderId: json['senderId'] as String,
      content: json['content'] as String,
      messageType: json['messageType'] as String,
      deletedBy: List<String>.from(json['deletedBy'] ?? []),
      status: json['status'] as String,
      deliveredAt: json['deliveredAt'] != null
          ? DateTime.tryParse(json['deliveredAt'])
          : null,
      seenAt: json['seenAt'] != null ? DateTime.tryParse(json['seenAt']) : null,
      seenBy: List<String>.from(json['seenBy'] ?? []),
      reactions: List<String>.from(json['reactions'] ?? []),
      sentAt: DateTime.parse(json['sentAt']),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'chatId': chatId,
      'senderId': senderId,
      'content': content,
      'messageType': messageType,
      'deletedBy': deletedBy,
      'status': status,
      'deliveredAt': deliveredAt?.toIso8601String(),
      'seenAt': seenAt?.toIso8601String(),
      'seenBy': seenBy,
      'reactions': reactions,
      'sentAt': sentAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
