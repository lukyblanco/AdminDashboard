import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // inicializo el controlador del provider del sideMenu
    SideMenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width >= 700) const SideBar(),
                Expanded(
                  child: Column(
                    children: [
                      // NavBar
                      const NavBar(),
                      // View
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: widget.child, //DashBoard_View
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            if (size.width < 700)
              AnimatedBuilder(
                animation: SideMenuProvider.menuController,
                builder: (context, child) => Stack(
                  children: [
                    if (SideMenuProvider.isOpen)
                      Opacity(
                        opacity: SideMenuProvider.opacity.value,
                        child: GestureDetector(
                          onTap: () => SideMenuProvider.closeMenu(),
                          child: Container(
                            width: size.width,
                            height: size.height,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    Transform.translate(
                      offset: Offset(SideMenuProvider.movement.value, 0),
                      child: const SideBar(),
                    ),
                  ],
                ),
              )
          ],
        ));
  }
}
