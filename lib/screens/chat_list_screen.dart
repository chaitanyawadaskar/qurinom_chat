import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurinom_project/config/api_config.dart';
import '../blocs/chat/chats_bloc.dart';

class ChatsListScreen extends StatefulWidget {
  final String userId;
  final String token;

  const ChatsListScreen({super.key, required this.userId, required this.token});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChatsBloc>().add(LoadUserChats(widget.userId, widget.token));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Chats"), automaticallyImplyLeading: false),
      body: BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
          print("state: $state");
          if (state is ChatsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatsLoaded) {
            final chats = state.chats;
            if (chats.isEmpty) {
              return const Center(child: Text("No chats found"));
            }
            return ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final chat = chats[index];

                final otherUser = chat.participants.firstWhere(
                    (p) => p.id != widget.userId,
                    orElse: () => chat.participants.first);

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: null,
                    // otherUser.profile?.isNotEmpty == true
                    //     ? NetworkImage(
                    //         "${ApiConfig.baseUrl}/${otherUser.profile?.toString() ?? ""}")
                    //     : null,
                    child: otherUser.profile?.isEmpty == true
                        ? Text(otherUser.name ?? "")
                        : null,
                  ),
                  title: Text(otherUser.name ?? ""),
                  subtitle:
                      Text(chat.lastMessage?.content ?? "No messages yet"),
                  trailing: chat.lastMessage != null
                      ? Text(
                          "${chat.lastMessage!.createdAt?.hour}:${chat.lastMessage!.createdAt?.minute.toString().padLeft(2, '0')}",
                          style: const TextStyle(fontSize: 12),
                        )
                      : null,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/chat',
                      arguments: {
                        'chatId': chat.id,
                        'userId': widget.userId,
                        'otherUserId': otherUser.id,
                        'token': widget.token,
                        "name": otherUser.name ?? "",
                      },
                    );
                  },
                );
              },
            );
          } else if (state is ChatsError) {
            return Center(child: Text("Error: ${state.message}"));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
