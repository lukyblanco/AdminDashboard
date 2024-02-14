import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/usuario.dart';
import 'package:flutter/material.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //* ver Word episodio 183
  // late GlobalKey<FormState> formkey;


  // void updateListeners() {
  //   notifyListeners();
  // }

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formkey.currentState!.validate();
  }

  Future updateUser() async {
    if (!_validForm()) {
      return false;
    }

    // Posteo a la BD
    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo,
    };

    try {
      final response = CafeApi.httpPut('/usuarios/${user!.uid}', data);
      // ignore: avoid_print
      print(response);
      return true;
    } catch (e) {
      // ignore: avoid_print
      print('error en updateUser $e');
      return false;
    }
  }
}
