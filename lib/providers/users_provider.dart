import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/models/usuario.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = false;
  bool ascending = true;
  int? sortColumnIndex;

  //? mando a traer los usuarios cuando se crea una instancia de la calse (constructor)
  UsersProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');

    final usersResponse = UsersResponse.fromJson(response);

    users = [...usersResponse.usuarios];
    isLoading = false;
    notifyListeners();
  }

  Future<Usuario?> getUserById(String uid) async {
    try {
      final response = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromJson(response);
      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      // throw Exception(e);
      return null;
    }
  }

  //* Ordena tablas (generica) tambien se podria hacer uno especifico para cada columna de la tabla
  // *oderna la lista
  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }

  void refreshUsers(Usuario newUser) {
    users = users.map((user) {
      if (user.uid == newUser.uid) {
        user = newUser;
      }
      return user;
    }).toList();
    notifyListeners();
  }
}
