import 'dart:convert';

Uri createUri(String url, Map<String, dynamic>? queryParameters) {
  final uri = Uri.parse(url);
  if (queryParameters != null) {
    return uri.replace(
      queryParameters: queryParameters.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );
  }
  return uri;
}

dynamic decodedBody(String stringBody, String? mimeType) {
  if (mimeType != null && mimeType.contains('application/json')) {
    try {
      return jsonDecode(stringBody);
    } on FormatException catch (_) {
      return stringBody;
    }
  } else {
    return stringBody;
  }
}
