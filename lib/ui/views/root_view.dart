import 'package:flutter/material.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      // ignore: prefer_const_constructors
      child: Center(
        child: const Text('RootView'),
      ),
    );
  }
}