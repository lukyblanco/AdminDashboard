import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {
  static late AnimationController menuController;
  static bool isOpen = false;

  // ignore: prefer_final_fields
  String _currentPage = '';
  String get currentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(String routeName) {
    _currentPage = routeName;
    // le doy tiempo a que se construya el widget
    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        notifyListeners();
      },
    );
  }

  static Animation<double> movement = Tween<double>(begin: -200, end: 0)
      .animate(
          CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isOpen = true;
    menuController.forward();
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse();
  }

  static void toggleMenu() {
    (isOpen) ? menuController.reverse() : menuController.forward();

    isOpen = !isOpen;
  }
}
