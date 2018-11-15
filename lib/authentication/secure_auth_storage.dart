import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:simple_auth/simple_auth.dart';

class SecureAuthStorage extends AuthStorage {
  final _storage = new FlutterSecureStorage();

  Future<void> write({@required String key, @required String value}) async =>
      await _storage.write(key: key, value: value);

  Future<String> read({@required String key}) async =>
      await _storage.read(key: key);
}
