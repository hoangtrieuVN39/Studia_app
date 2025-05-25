import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:studia/core/constants/api_constants.dart';

class WebSocketManager {
  final String url;
  final WebSocketChannel channel;

  final basedUrl = 'ws://${ApiConstants.baseUrl}/ws/';

  WebSocketManager({required this.url})
    : channel = WebSocketChannel.connect(Uri.parse(url));

  void sendMessage(String message) {
    channel.sink.add(message);
  }

  void onMessage(void Function(String) onMessage) {
    channel.stream.listen((message) {
      onMessage(message);
    });
  }

  void close() {
    channel.sink.close();
  }
}
