import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName) {
    return navigatorkey.currentState!.pushNamed( routeName) ;
  }

  static replaceTo(String routeName) {
    return navigatorkey.currentState!.pushReplacementNamed( routeName) ;
  }
}
