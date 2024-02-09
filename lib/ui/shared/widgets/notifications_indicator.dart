import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Stack(
        children: [
          const Icon(Icons.notifications_none_outlined, color: Colors.grey,),
          Container(
            width: 5,
            height: 5,
            decoration: buildDecoration(),
          )
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() {
    return BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(100),
    );
  } 
}

