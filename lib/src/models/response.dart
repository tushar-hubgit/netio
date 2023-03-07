import 'package:netio/src/models/request.dart';

class Response {
  /// The Http [Request] linked with this [Response].
  final Request? request;

  /// The response headers.
  final Map<String, String>? headers;

  /// The status code returned by the server.
  final int? statusCode;

  /// The decoded body of this [Response].
  final dynamic body;

  Response({
    this.request,
    this.headers,
    this.statusCode,
    required this.body,
  });

  @override
  String toString() {
    return 'Response(request: $request, headers: $headers, statusCode: $statusCode, body: $body)';
  }
}
