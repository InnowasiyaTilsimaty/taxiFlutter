import 'dart:convert';

import '../../model/model.dart';
import '../service.dart';

final class AuthService {
  AppPrefsService prefsService;

  AuthService({required this.prefsService});

  Future<void> signIn(Response user) async {
    final userJson = user.toJson();
    final userString = jsonEncode(userJson);
    await prefsService.setString(PreferencesKeys.token, userString);
  }

  Response? getToken() {
    final userString = prefsService.getString(PreferencesKeys.token);
    if (userString != null) {
      final userJson = jsonDecode(userString);
      return Response.fromJson(userJson as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<void> writeUser(GetMe user) async {
    if (user.id == getUser()?.id) return;
    final userJson = user.toJson();
    final userString = jsonEncode(userJson);
    await prefsService.setString(PreferencesKeys.user, userString);
  }

  GetMe? getUser() {
    final userString = prefsService.getString(PreferencesKeys.user);
    if (userString != null) {
      final userJson = jsonDecode(userString);
      return GetMe.fromJson(userJson as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<void> signOut() async {
    await prefsService.remove(PreferencesKeys.token);
  }
}
