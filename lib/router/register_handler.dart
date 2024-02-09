import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:provider/provider.dart';

class RegisterHandler {
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
