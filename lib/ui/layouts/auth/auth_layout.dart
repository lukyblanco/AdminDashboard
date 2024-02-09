import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/cutom_titlle.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Scrollbar(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              (size.width > 1000)
                ? _DesktopBody(child: child)
                : _MobileBody(child: child),
          
                // LinksBar (footer)
                const LinksBar(),
            ],
          ),
        ));
  }
}

// * MOBILE BODY
class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [ 
          const SizedBox(height: 20,),
          const CustomTittle(),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: 420,
            child: const BackgroundTwitter(),
          ),
        ],
      ),
    );
  }
}


// * DESKTOP BODY
class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.black,
      child: Row(
        children: [
          // Twitter Backgorund
          const Expanded(child: BackgroundTwitter()),

          // View Container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CustomTittle(),
                const SizedBox(height: 50),
                // Expanded(child: LoginView()),
                // Expanded(child: RootView()),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
