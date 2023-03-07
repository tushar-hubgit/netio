class Request {
  /// Headers attach to this [Request]
  final Map<String, String> headers;

  /// The [Uri] from request
  final Uri url;

  /// The Http Method from this [Request]
  /// ex: `GET`,`POST`,`PUT`,`DELETE`
  final String method;

  Request({
    required this.headers,
    required this.url,
    required this.method,
  });

  @override
  String toString() => 'Request(headers: $headers, url: $url, method: $method)';
}
