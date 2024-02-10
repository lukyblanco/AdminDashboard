import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/models/http/auth_responde.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  // String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  //* LOGIN
  login(String email, String password) {
    final data = {'correo': email, 'password': password};

    CafeApi.httpPost('/auth/login', data).then((json) {
      // ignore: avoid_print
      print(json);
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      notifyListeners();
    }).catchError((e) {
      // ignore: avoid_print
      print('error en: $e');
      NotificationServices.showSnackBarErrors('Datos no Validos');
    });
  }

//* REGISTER
  register(String email, String password, String name) {
    final data = {'nombre': name, 'correo': email, 'password': password};

    CafeApi.httpPost('/usuarios', data).then((json) {
      // ignore: avoid_print
      print(json);
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      CafeApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      // ignore: avoid_print
      print('error en: $e');
      NotificationServices.showSnackBarErrors('Datos no Validos');
    });
  }

  //* AUTENTICACION
  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromJson(response);
      LocalStorage.prefs.setString('token', authResponse.token);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      CafeApi.configureDio();
      notifyListeners();
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  //* LOGOUT
  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
