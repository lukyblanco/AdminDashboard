import 'package:admin_dashboard/router/dashboard_handler.dart';
import 'package:admin_dashboard/router/register_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dash Router
  static String dashboardRoute = '/dashboard';



  static void configureRoutes() {
    // Auth Routes
    // router.define(rootRoute, handler: AdminHandlers.root,transitionType: TransitionType.none);
    router.define(rootRoute, handler: AdminHandlers.login,transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login,transitionType: TransitionType.none);
    router.define(registerRoute, handler: RegisterHandler.register,transitionType: TransitionType.none);
    
    // Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
