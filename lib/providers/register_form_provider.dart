import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    if (formkey.currentState!.validate()) {
      print('Form valido -- login');
      return true;
    } else {
      print('Form no valido');
      return false;
    }
  }
}
