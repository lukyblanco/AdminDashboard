import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.dashboardRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const DashboardView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.iconsRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const IconsView();
      } else {
        return const LoginView();
      }
    },
  );
  
  static Handler blank = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context, listen: false)
          .setCurrentPageUrl(Flurorouter.blankRoute);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return const BlanckView();
      } else {
        return const LoginView();
      }
    },
  );
}
