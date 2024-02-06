import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // TODO Peticion HTTP

    _token = 'asdasd.asdasd.asdas';
    // si todo sale bien, tenemos que almacenar el JWT en el dipositivo o si es web en el localStorage
    LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // si no es null el token
    // TODO ir al Backend y comprobar si el JWT es valido

    await Future.delayed(
        const Duration(seconds: 1)); //simula la pegada al backend
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
