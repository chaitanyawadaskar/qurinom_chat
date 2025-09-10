import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qurinom_project/models/send_message.dart';
import '../blocs/chat/chat_bloc.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String otherUserId;
  final String userId;
  final String token;
  final String name;

  const ChatScreen({
    super.key,
    required this.chatId,
    required this.otherUserId,
    required this.userId,
    required this.token,
    required this.name,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(LoadMessages(widget.chatId, widget.token));
  }

  void _sendMessage() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    final message = SendMessageModel(
      chatId: widget.chatId,
      senderId: widget.userId,
      content: text,
      messageType: "text",
      fileUrl: null,
      deletedBy: [],
      status: "sent",
      deliveredAt: null,
      seenAt: null,
      seenBy: [],
      id: "",
      reactions: [],
      sentAt: DateTime.now(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 0,
    );

    context.read<ChatBloc>().add(SendMessageEvent(message, widget.token));
    messageController.clear();
    FocusScope.of(context).unfocus();
    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent,
    );
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatBloc, ChatState>(
              listener: (context, state) {
                if (state is ChatLoaded) {
                  _scrollToBottom();
                }
              },
              builder: (context, state) {
                if (state is ChatLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ChatLoaded) {
                  return ListView.builder(
                    controller: _scrollController,
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      final msg = state.messages[index];
                      final isMe = msg.senderId == widget.userId;
                      return Align(
                        alignment:
                            isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: isMe ? Colors.blue[100] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(msg.content),
                        ),
                      );
                    },
                  );
                } else if (state is ChatError) {
                  return Center(child: Text("Error: ${state.message}"));
                }
                return const SizedBox();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration:
                        const InputDecoration(hintText: "Type a message..."),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
