import 'dart:convert';
import 'dart:developer';
import '../models/chat.dart';
import '../models/message.dart';
import '../models/send_message.dart';
import '../services/api_service.dart';

class ChatRepository {
  final ApiService _api = ApiService();

  Future<ChatModel> getUserChats(String userId, {String? token}) async {
    final resp = await _api.get('/chats/user-chats/$userId', token: token);
    log("resp.body ${resp.body}");
    if (resp.statusCode == 200) {
      final json = jsonDecode(resp.body);

      return ChatModel.fromJson(json);
    } else {
      throw Exception('Failed to load chats: \${resp.statusCode}');
    }
  }

  Future<List<ChatModel>> fetchChats(String userId, String token) async {
    final response = await _api.get('/chats/user-chats/$userId', token: token);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data
          .map((chat) => ChatModel.fromJson(chat as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load chats');
    }
  }

  Future<List<MessageModel>> getChatMessages(String chatId,
      {String? token}) async {
    final resp =
        await _api.get('/messages/get-messagesformobile/$chatId', token: token);
    if (resp.statusCode == 200) {
      final List<dynamic> data = json.decode(resp.body);
      return data.map((json) => MessageModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load messages: \${resp.statusCode}');
    }
  }

  Future<dynamic> sendMessage(SendMessageModel model, {String? token}) async {
    final resp = await _api.post(
      '/messages/sendMessage',
      model.toJson(),
      token: token,
    );
    return json.decode(resp.body);
  }
}
