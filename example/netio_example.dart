import 'package:netio/netio.dart';

void main() async {
  final netio = Netio();

  final resp = await netio.get(
    "https://api.ipify.org",
    queryParameters: {"format": "json"},
  );

  final ip = resp.body['ip'];

  print("[Your IP] $ip");
}
