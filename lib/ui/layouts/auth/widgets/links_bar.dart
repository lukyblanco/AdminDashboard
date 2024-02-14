import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        color: Colors.black,
        height: ( size.width > 1000 ) ? size.height * 0.07 : null,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            // ignore: avoid_print
            LinkText(text: 'About', onPressed: () => print('about')),
            const LinkText(text: 'Help Center'),
            const LinkText(text: 'Privaci policy'),
            const LinkText(text: 'Cookie'),
            const LinkText(text: 'Blog'),
            const LinkText(text: 'Status'),
            const LinkText(text: 'Resources'),
            const LinkText(text: 'Advertising'),
          ],
        ));
  }
}
