import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/features/chat/data/datasources/chat_remote_data_source_impl.dart';
import 'package:studia/features/chat/data/repositories/message_repository_impl.dart';
import 'package:studia/features/chat/domain/usecases/chip_message.dart';
import 'package:studia/features/chat/domain/usecases/create_message.dart';
import 'package:studia/features/chat/domain/usecases/get_message_stream.dart';
import 'package:studia/features/chat/domain/usecases/send_message.dart';
import 'package:studia/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:studia/features/chat/presentation/pages/chat_container.dart';
import 'package:studia/main.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => ChatBloc(
                createMessageUseCase: CreateMessage(),
                chipMessageUseCase: ChipMessage(),
                sendMessageUseCase: SendMessage(
                  MessageRepositoryImpl(
                    remoteDataSource: ChatRemoteDataSourceImpl(
                      websocketBaseUrl: 'ws://localhost:8000/ws/',
                      userId: getIt<UserProvider>().user!.id,
                    ),
                  ),
                ),
                getMessageStreamUseCase: GetMessageStream(
                  MessageRepositoryImpl(
                    remoteDataSource: ChatRemoteDataSourceImpl(
                      websocketBaseUrl: 'ws://localhost:8000/ws/',
                      userId: getIt<UserProvider>().user!.id,
                    ),
                  ),
                ),
                user: getIt<UserProvider>().user!,
              ),
        ),
      ],
      child: ChatContainer(),
    );
  }
}
