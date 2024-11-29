import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecurityStorage{
  static final _storage = const FlutterSecureStorage();
  static const _keyId = 'id';
  static const _keyUsername = 'username';
  static const _keyPassword = 'password'; 
  static const _keytoken = 'token';
  static const _keyemail = 'email';

  UserSecurityStorage._();

  static Future setId(String id) async =>
      await _storage.write(key: _keyId, value: id);

  static Future<String?> getId() async =>
      await _storage.read(key: _keyId);

  static Future setUsername(String username) async =>
      await _storage.write(key: _keyUsername, value: username);

  static Future<String?> getUsername() async =>
      await _storage.read(key: _keyUsername);
      
  static Future setPassword(String password) async =>
      await _storage.write(key: _keyPassword, value: password);

  static Future<String?> getPassword() async =>
        await _storage.read(key: _keyPassword);


  // static Future setRole(String role) async =>
  //     await _storage.write(key: _keyRole, value: role);

  // static Future<String?> getRole() async =>
  //       await _storage.read(key: _keyRole);

  static Future setToken(String token) async =>
      await _storage.write(key: _keytoken, value: token);

  static Future<String?> getToken() async =>
      await _storage.read(key: _keytoken);

  static Future setEmail(String email) async =>
      await _storage.write(key: _keyemail, value: email);

  static Future<String?> getEmail() async =>
      await _storage.read(key: _keyemail);




  


  static Future deleteAll() async => await _storage.deleteAll();

}