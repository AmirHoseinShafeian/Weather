import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weather_app/configs/di.dart';
import 'package:weather_app/core/extentions.dart';

class UserInfos {
  static Future<void> clear() async {
    await getIt<FlutterSecureStorage>().deleteAll();
  }

  static Future<void> setToken(String token) async {
    await getIt<FlutterSecureStorage>().write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    return await getIt<FlutterSecureStorage>().read(key: 'token');
  }

  static Future<void> setRefreshToken(String refreshToken) async {
    await getIt<FlutterSecureStorage>()
        .write(key: 'refreshToken', value: refreshToken);
  }

  static Future<String?> getRefreshToken() async {
    return await getIt<FlutterSecureStorage>().read(key: 'refreshToken');
  }

  static Future<void> setMobile(String mobile) async {
    await getIt<FlutterSecureStorage>().write(key: 'mobile', value: mobile);
  }

  static Future<String?> getMobile() async {
    return await getIt<FlutterSecureStorage>().read(key: 'mobile');
  }

  static Future<void> setEmail(String Email) async {
    await getIt<FlutterSecureStorage>().write(key: 'email', value: Email);
  }

  static Future<String?> getEmail() async {
    return await getIt<FlutterSecureStorage>().read(key: 'email');
  }

  static Future<void> setId(String Id) async {
    await getIt<FlutterSecureStorage>().write(key: 'Id', value: Id);
  }

  static Future<String?> getId() async {
    return await getIt<FlutterSecureStorage>().read(key: 'Id');
  }

  //for unknown value
  static Future<void> setListString(String name, List<String> data) async {
    await getIt<FlutterSecureStorage>()
        .write(key: name, value: jsonEncode(data));
  }

  static Future<void> setString(String name, String value) async {
    await getIt<FlutterSecureStorage>().write(key: name, value: value);
  }

  static Future<void> setInt(String name, int value) async {
    await getIt<FlutterSecureStorage>()
        .write(key: name, value: value.toString());
  }

  static Future<void> setBool(String name, bool value) async {
    await getIt<FlutterSecureStorage>()
        .write(key: name, value: value.toString());
  }

  static Future<String?> read(String name) async {
    return await getIt<FlutterSecureStorage>().read(key: name);
  }

  static Future<int?> getInt(String name) async {
    return int.tryParse((await getIt<FlutterSecureStorage>().read(key: name))!);
  }

  static Future<bool?> getbool(String name) async {
    return ((await getIt<FlutterSecureStorage>().read(key: name)) ?? 'false') ==
        'true';
  }

  static Future<String?> getString(String name) async {
    return await getIt<FlutterSecureStorage>().read(key: name);
  }

  static Future<List<String>?> getListString(String name) async {
    if ((await getIt<FlutterSecureStorage>().read(key: name))
        .isNotNullOrEmpty) {
      return (jsonDecode(
                  await getIt<FlutterSecureStorage>().read(key: name) ?? '')
              as List)
          .map((e) => e.toString())
          .toList();
    }
    return null;
  }
}
