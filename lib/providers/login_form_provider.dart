import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm() {
    if (formkey.currentState!.validate()) {
      // print('Form valido -- login');
      return true;
    } else {
      // print('Form no valido');
      return false;
    }
  }
}
