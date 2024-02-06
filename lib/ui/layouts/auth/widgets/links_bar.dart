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
            LinkText(text: 'About', onPressed: () => print('about')),
            LinkText(text: 'Help Center'),
            LinkText(text: 'Privaci policy'),
            LinkText(text: 'Cookie'),
            LinkText(text: 'Blog'),
            LinkText(text: 'Status'),
            LinkText(text: 'Resources'),
            LinkText(text: 'Advertising'),
          ],
        ));
  }
}
