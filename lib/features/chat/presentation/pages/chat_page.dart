import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studia/core/core.dart';
import 'package:studia/core/data/datasources/remote/datasource_remote.dart';
import 'package:studia/core/data/datasources/remote/dio_service.dart';
import 'package:studia/core/di/provider.dart';
import 'package:studia/core/domain/entities/user.dart';
import 'package:studia/core/domain/usecases/websocket/connect_websocket.dart';
import 'package:studia/core/domain/usecases/websocket/disconnect_websocket.dart';
import 'package:studia/core/domain/usecases/websocket/get_websocket_stream.dart';
import 'package:studia/core/domain/usecases/websocket/send_websocket_message.dart';
import 'package:studia/features/chat/data/datasources/chat_remote_data_source_impl.dart';
import 'package:studia/features/chat/data/repositories/message_repository_impl.dart';
import 'package:studia/features/chat/domain/usecases/chip_message.dart';
import 'package:studia/features/chat/domain/usecases/create_message.dart';
import 'package:studia/features/chat/domain/usecases/get_messages_usecase.dart';
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
                getMessagesUseCase: GetMessagesUsecase(
                  MessageRepositoryImpl(
                    remoteDataSource: ChatRemoteDataSourceImpl(
                      datasourceRemote: ApiClient(
                        dio: getIt.get<DioService>().dio,
                      ),
                    ),
                  ),
                  getIt<UserProvider>().user!.id,
                ),
                websocketUrl:
                    '${ApiConstants.baseUrl}/${ApiConstants.websocket}${getIt<UserProvider>().user!.id}',
                createMessageUseCase: CreateMessage(),
                chipMessageUseCase: ChipMessage(),
                user: getIt<UserProvider>().user!,
                connectWebSocketUseCase: ConnectWebSocket(getIt()),
                disconnectWebSocketUseCase: DisconnectWebSocket(getIt()),
                sendWebSocketMessageUseCase: SendWebSocketMessage(getIt()),
                getWebSocketStreamUseCase: GetWebSocketStream(getIt()),
              ),
        ),
      ],
      child: ChatContainer(),
    );
  }
}
