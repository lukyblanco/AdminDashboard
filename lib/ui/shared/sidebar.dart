import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'main'),
          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () => SideMenuProvider.closeMenu(),
          ),
          MenuItem(text: 'Orders',icon: Icons.shopping_cart_outlined,onPressed: () {},),
          MenuItem(text: 'Analytic',icon: Icons.show_chart_outlined,onPressed: () {},),
          MenuItem(text: 'Categories',icon: Icons.layers_outlined,onPressed: () {},),
          MenuItem(text: 'Products',icon: Icons.dashboard_outlined,onPressed: () {},),
          MenuItem(text: 'Discount',icon: Icons.attach_money_outlined,onPressed: () {},),
          MenuItem(text: 'Customer',icon: Icons.people_alt_outlined,onPressed: () {},),

          const SizedBox(height: 30),
          const TextSeparator(text: 'UI Elements'),

          MenuItem(text: 'Icons',icon: Icons.list_alt_outlined,onPressed: () {},),
          MenuItem(text: 'Marketing',icon: Icons.markunread_outlined,onPressed: () {},),
          MenuItem(text: 'Campaign',icon: Icons.note_add_outlined,onPressed: () {},),
          MenuItem(text: 'Blanck',icon: Icons.post_add_outlined,onPressed: () {},),
          MenuItem(text: 'Logoout',icon: Icons.exit_to_app_outlined,onPressed: () {},),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff092044),
            Color(0xff092060),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          )
        ]
      );
}
