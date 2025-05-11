import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/widgets/app_bar.dart';
import 'package:studia/features/chat/presentation/bloc/chat_bloc.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBarTitle.build(context, 'Chat'),
          body: Container(child: Column(children: [Text('Chat')])),
        );
      },
    );
  }
}
