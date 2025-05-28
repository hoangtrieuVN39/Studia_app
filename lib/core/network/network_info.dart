import 'dart:io';
import 'dart:async';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

enum NetworkStatus {
  connected,
  disconnected,
  serverAccessible,
  serverInaccessible,
}

class NetworkInfoImpl implements NetworkInfo {
  final _controller = StreamController<NetworkStatus>.broadcast();
  Timer? _timer;

  NetworkInfoImpl() {}

  void dispose() {
    _timer?.cancel();
    _controller.close();
  }

  @override
  Future<bool> get isConnected async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (e) {
      print('Connection check failed: ${e.message} (${e.address})');
      return false;
    }
  }
}
