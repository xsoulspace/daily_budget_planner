// bin/server.dart
import 'dart:io';

import 'package:shelf/shelf_io.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Manages WebSocket connections for collaborative todo synchronization
class CollaborativeTodoServer {
  /// Set to store active WebSocket connections
  final _connections = <WebSocketChannel>{};

  /// Handles new WebSocket connection
  void handleConnection(
    final WebSocketChannel webSocket,
    final String? subprotocol,
  ) {
    _connections.add(webSocket);
    print('New WebSocket connection established');

    webSocket.stream.listen(
      (final message) {
        print('Received message: $message');
        // Broadcast to all other connected clients
        _broadcastExcept(webSocket, message);
      },
      onDone: () {
        print('WebSocket connection closed');
        _connections.remove(webSocket);
      },
      onError: (final error) {
        print('WebSocket error: $error');
        _connections.remove(webSocket);
      },
    );
  }

  /// Broadcasts message to all connections except the sender
  void _broadcastExcept(final WebSocketChannel sender, final message) {
    for (final connection in _connections) {
      if (connection != sender) {
        // connection.sink.add(message);
      }
    }
  }
}

void main() async {
  final server = CollaborativeTodoServer();
  final handler = webSocketHandler(server.handleConnection);

  final httpServer = await serve(
    handler,
    InternetAddress.anyIPv4,
    8080,
    shared: true,
  );

  print(
    'Collaborative Todo WebSocket server running on ws://${httpServer.address.host}:${httpServer.port}',
  );
}
