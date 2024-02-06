import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:admin_dashboard/ui/views/root_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler root = Handler(
    handlerFunc: (context, parameters) {
      // Lógica para la ruta de la raíz, si es necesario
      return const RootView();
    },
  );

  static Handler login = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const LoginView();
      } else {
        return const DashboardView();
      }
    },
  );

  static Handler register = Handler(
    handlerFunc: (context, parameters) {

      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const RegisterView();
      } else {
        return const DashboardView();
      }
    },
  );
}
