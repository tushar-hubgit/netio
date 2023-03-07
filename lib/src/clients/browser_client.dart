// ignore: avoid_web_libraries_in_flutter
import 'dart:async';
import 'dart:html';

import 'package:netio/netio.dart';
import 'package:netio/src/constants/constants.dart';
import 'package:netio/src/models/response.dart';
import 'package:netio/src/models/request.dart';
import 'package:netio/src/utils/utils.dart';

Netio createNetio() => BrowserClient();

class BrowserClient implements Netio {
  final xhr = HttpRequest();

  @override
  Future<Response> fetch(Request request) {
    xhr.open(request.method, request.url.toString(), async: true);

    xhr.setRequestHeader('User-Agent', Constants.userAgent);
    request.headers.forEach(xhr.setRequestHeader);

    final c = Completer<Response>();
    xhr.onLoad.listen((event) {
      final body = decodedBody(xhr.responseText!, xhr.responseType);

      c.complete(Response(
        body: body,
        headers: xhr.responseHeaders,
        request: request,
        statusCode: xhr.status,
      ));
    });

    xhr.send();

    return c.future;
  }

  @override
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters, Map<String, String>? headers}) {
    final uri = createUri(url, queryParameters);
    final request = Request(headers: headers ?? {}, url: uri, method: 'GET');
    return fetch(request);
  }
}
