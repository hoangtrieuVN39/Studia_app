import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:studia/features/chat/presentation/pages/chat_container.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ChatBloc())],
      child: ChatContainer(),
    );
  }
}
