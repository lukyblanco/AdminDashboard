import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/views/no_page_found.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) {
      Provider.of<SideMenuProvider>(context!, listen: false)
          .setCurrentPageUrl('/404');
      return const NotPageFoundView();
    },
  );
}
