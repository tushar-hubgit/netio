A composable, Future-based library for making HTTP requests.

This package contains a set of high-level functions and classes that make it easy to consume HTTP resources. It's multi-platform, and supports mobile, desktop, and the browser.

## Usage

The easiest way to use this library is via the top-level functions. They allow you to make individual HTTP requests with minimal hassle:

```dart
import 'package:netio/netio.dart';

final netio = Netio();
final resp = await netio.get(
    "https://api.ipify.org", 
    queryParameters: {"format": "json"}
);

final ip = resp.body['ip'];
print("[Your IP] $ip");
```