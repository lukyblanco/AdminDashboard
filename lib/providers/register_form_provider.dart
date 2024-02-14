import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    if (formkey.currentState!.validate()) {
      // ignore: avoid_print
      print('Form valido -- login');
      return true;
    } else {
      // ignore: avoid_print
      print('Form no valido');
      return false;
    }
  }
}
