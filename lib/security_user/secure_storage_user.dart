import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecurityStorage{
  static final _storage = const FlutterSecureStorage();
  static const _keyUsername = 'username';
  static const _keyPassword = 'password';
  static const _keyFullName = 'fullname';
  static const _keyRole = 'role';
  static const _keyVendorId = 'vendorId';
  static const _keytoken = 'token';
  static const _cookie = 'cookie';
  

  UserSecurityStorage._();

  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future setPassword(String password) async =>
      await _storage.write(key: _keyPassword, value: password);

  static Future setToken(String token) async =>
      await _storage.write(key: _keytoken, value: token);

  static Future setCookie(String cookie) async =>
      await _storage.write(key: _cookie, value: cookie);

  static Future setFullName(String fullname) async =>
      await _storage.write(key: _keyFullName, value: fullname);

  static Future setRole(String role) async =>
      await _storage.write(key: _keyRole, value: role);

  static Future setVendorId(String vendorId) async =>
      await _storage.write(key: _keyVendorId, value: vendorId);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _keyUsername);

  static Future<String?> getPassword() async =>
      await _storage.read(key: _keyPassword);

  static Future<String?> getToken() async =>
      await _storage.read(key: _keytoken);

  static Future<String?> getCookie() async => await _storage.read(key: _cookie);

  static Future<String?> getFullName() async =>
      await _storage.read(key: _keyFullName);

  static Future<String?> getRole() async => await _storage.read(key: _keyRole);

  static Future<String?> getVendorId() async =>
      await _storage.read(key: _keyVendorId);


  static Future deleteAll() async => await _storage.deleteAll();

}