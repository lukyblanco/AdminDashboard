import 'package:admin_dashboard/ui/views/no_page_found.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters) {
      return const NotPageFoundView();
    },
  );
}


