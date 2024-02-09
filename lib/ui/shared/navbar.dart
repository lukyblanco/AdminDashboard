import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
                onPressed: () {
                  SideMenuProvider.openMenu();
                },
                icon: const Icon(Icons.menu_outlined)),

          const SizedBox(width: 5),

          // SearchInput
          if (size.width > 400)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 250),
              child: const SearchText(),
            ),

          const Spacer(),

          const NotificationsIndicator(),
          const SizedBox(width: 10),
          const NavBarAvatar(),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]);
  }
}
