import 'dart:convert';
import 'dart:io';

import 'package:netio/netio.dart';
import 'package:netio/src/constants/constants.dart';
import 'package:netio/src/models/request.dart';
import 'package:netio/src/models/response.dart';
import 'package:netio/src/utils/utils.dart';

Netio createNetio() => IOClient();

class IOClient implements Netio {
  final _httpClient = HttpClient();

  @override
  Future<Response> fetch(Request request) async {
    _httpClient.userAgent = Constants.userAgent;

    final ioRequest = await _httpClient.openUrl(request.method, request.url);

    request.headers.forEach(ioRequest.headers.add);

    final response = await ioRequest.close();

    var headers = <String, String>{};
    response.headers.forEach((key, values) {
      headers[key] = values.join(',');
    });

    var bodyString = await response.transform(utf8.decoder).join();

    final body =
        decodedBody(bodyString, response.headers.contentType?.mimeType);

    return Response(
      headers: headers,
      body: body,
      request: request,
      statusCode: response.statusCode,
    );
  }

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final uri = createUri(url, queryParameters);
    final request = Request(headers: headers ?? {}, url: uri, method: 'GET');
    return fetch(request);
  }
}
