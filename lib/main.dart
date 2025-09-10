import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'blocs/auth/auth_bloc.dart';
import 'blocs/chat/chat_bloc.dart';
import 'blocs/chat/chats_bloc.dart';
import 'repositories/auth_repository.dart';
import 'repositories/chat_repository.dart';

import 'screens/chat_list_screen.dart';
import 'screens/login_screen.dart';
import 'screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authRepository = AuthRepository();
  final chatRepository = ChatRepository();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');
  runApp(MyApp(
    authRepository: authRepository,
    chatRepository: chatRepository,
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final ChatRepository chatRepository;
  final String? token;
  const MyApp({
    super.key,
    required this.authRepository,
    required this.chatRepository,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(authRepository),
        ),
        BlocProvider<ChatsBloc>(
          create: (_) => ChatsBloc(chatRepository),
        ),
        BlocProvider<ChatBloc>(
          create: (_) => ChatBloc(chatRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: token != null ? '/chats' : '/',
        routes: {
          '/': (context) => const LoginScreen(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/chats') {
            final args = settings.arguments as Map<String, dynamic>?;

            return MaterialPageRoute(
              builder: (_) => FutureBuilder(
                future: SharedPreferences.getInstance(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  }

                  final prefs = snapshot.data!;
                  final userId =
                      args?['userId'] ?? prefs.getString('userId') ?? '';
                  final token =
                      args?['token'] ?? prefs.getString('token') ?? '';

                  return ChatsListScreen(userId: userId, token: token);
                },
              ),
            );
          }

          if (settings.name == '/chat') {
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => ChatScreen(
                chatId: args['chatId'],
                userId: args['userId'],
                otherUserId: args['otherUserId'],
                token: args['token'],
                name: args['name'],
              ),
            );
          }

          return null;
        },
      ),
    );
  }
}
