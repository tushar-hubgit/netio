library netio;

import 'src/models/request.dart';
import 'src/models/response.dart';

import 'src/clients/io_client.dart'
    if (dart.library.html) 'src/clients/browser_client.dart';

abstract class Netio {
  factory Netio() => createNetio();

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<Response> fetch(Request request);
}
