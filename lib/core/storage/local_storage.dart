import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalStorageService {
  final _storage = const FlutterSecureStorage();

  static const tokenKey = "token";
  static const rememberKey = "remember_me";

  Future<void> saveToken(String token) async {
    await _storage.write(key: tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: tokenKey);
  }

  Future<void> saveRememberMe(bool value) async {
    await _storage.write(key: rememberKey, value: value.toString());
  }

  Future<bool> getRememberMe() async {
    final value = await _storage.read(key: rememberKey);
    return value == "true";
  }

  Future<void> clear() async {
    await _storage.deleteAll();
  }

  Future<void> logout() async {
    await clear();
  }
}
