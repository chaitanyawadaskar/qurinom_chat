import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurinom_project/models/chat.dart';
import '../../repositories/chat_repository.dart';

abstract class ChatsEvent {}

class LoadUserChats extends ChatsEvent {
  final String userId;
  final String token;
  LoadUserChats(this.userId, this.token);
}

/// States
abstract class ChatsState {}

class ChatsInitial extends ChatsState {}

class ChatsLoading extends ChatsState {}

class ChatsLoaded extends ChatsState {
  final List<ChatModel> chats;
  ChatsLoaded(this.chats);
}

class ChatsError extends ChatsState {
  final String message;
  ChatsError(this.message);
}

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final ChatRepository chatRepository;
  ChatsBloc(this.chatRepository) : super(ChatsInitial()) {
    on<LoadUserChats>(_onLoadUserChats);
  }

  Future<void> _onLoadUserChats(
      LoadUserChats event, Emitter<ChatsState> emit) async {
    emit(ChatsLoading());
    try {
      final chats = await chatRepository.fetchChats(event.userId, event.token);
      emit(ChatsLoaded(chats));
    } catch (e) {
      emit(ChatsError(e.toString()));
    }
  }
}
