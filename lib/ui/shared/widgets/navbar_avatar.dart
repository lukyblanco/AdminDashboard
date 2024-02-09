import 'package:flutter/material.dart';

class NavBarAvatar extends StatelessWidget {
  const NavBarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      // ignore: sized_box_for_whitespace
      child: Container(
        width: 30,
        height: 30,
        child: Image.network('https://cdn.icon-icons.com/icons2/2643/PNG/512/male_man_person_people_avatar_white_tone_icon_159365.png'),
      ),
    );
  }
}

