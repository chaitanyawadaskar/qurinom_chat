import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurinom_project/models/message.dart';
import '../../models/send_message.dart';
import '../../repositories/chat_repository.dart';

// Events
abstract class ChatEvent {}

class LoadMessages extends ChatEvent {
  final String chatId;
  final String token;
  LoadMessages(this.chatId, this.token);
}

class SendMessageEvent extends ChatEvent {
  final SendMessageModel message;
  final String token;
  SendMessageEvent(this.message, this.token);
}

// States
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<MessageModel> messages;
  ChatLoaded(this.messages);
}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}

// Bloc
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository chatRepository;
  List<MessageModel> _messages = [];

  ChatBloc(this.chatRepository) : super(ChatInitial()) {
    on<LoadMessages>(_onLoadMessages);
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onLoadMessages(
      LoadMessages event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      final msgs = await chatRepository.getChatMessages(
        event.chatId,
        token: event.token,
      );
      _messages = msgs;
      emit(ChatLoaded(msgs));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> _onSendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    try {
      // 1. Call sendMessage API
      await chatRepository.sendMessage(event.message, token: event.token);

      // 2. Reload messages after successful send
      final msgs = await chatRepository.getChatMessages(
        event.message.chatId ?? "",
        token: event.token,
      );

      _messages = msgs;
      emit(ChatLoaded(msgs));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }
}
