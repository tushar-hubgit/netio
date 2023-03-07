import 'package:netio/netio.dart';
import 'package:test/test.dart';

void main() {
  final netio = Netio();

  group('GET', () {
    test('GET request returns expected status code', () async {
      final response =
          await netio.get('https://jsonplaceholder.typicode.com/posts');
      expect(response.statusCode, 200);
    });

    test('GET request returns expected data', () async {
      final response =
          await netio.get('https://jsonplaceholder.typicode.com/posts');
      expect(response.body.isNotEmpty, true);
    });

    test('GET request returns expected headers', () async {
      final response =
          await netio.get('https://jsonplaceholder.typicode.com/posts');
      expect(
          response.headers?['content-type'], 'application/json; charset=utf-8');
    });

    test('GET request with query parameters returns expected data', () async {
      final response = await netio.get(
        'https://jsonplaceholder.typicode.com/posts',
        queryParameters: {'postId': 1},
      );
      expect(response.statusCode, 200);
      expect(response.body.isNotEmpty, true);
      expect(
          response.headers?['content-type'], 'application/json; charset=utf-8');
    });

    test('GET request with multiple query parameters returns expected data',
        () async {
      final response = await netio.get(
        'https://jsonplaceholder.typicode.com/comments',
        queryParameters: {'postId': 1, 'id': 1},
      );
      expect(response.statusCode, 200);
      expect(response.body.isNotEmpty, true);
      expect(
          response.headers?['content-type'], 'application/json; charset=utf-8');
    });

    test('GET request with custom headers returns expected data', () async {
      final headers = {
        'Authorization':
            'Bearer htlO9cmVhY/8fufUOyfvQCm-smoz3LNgz3oJquUjTTkLzyMzVzcImd0C0cEH2Srz'
      };
      final response =
          await netio.get('https://api.ipify.org', headers: headers);
      expect(response.statusCode, 200);
      expect(response.request?.headers, headers);
    });
  });
}
