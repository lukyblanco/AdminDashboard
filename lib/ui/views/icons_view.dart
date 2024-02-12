import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Text(
          'Icons',
          style: CustomLabels.h1,
        ),
        const SizedBox(height: 10),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis
              .horizontal, //elementos uno al lado del otro y cuando no entran, nueva linea
          children: [
            WhiteCard(
              title: 'abc_sharp',
              width: 170,
              child: Center(
                child: Icon(Icons.abc_sharp),
              ),
            ),
            WhiteCard(
              title: 'ac_unit_outlined',
              width: 170,
              child: Center(
                child: Icon(Icons.ac_unit_outlined),
              ),
            ),
            WhiteCard(
              title: 'accessibility_rounded',
              width: 170,
              child: Center(
                child: Icon(Icons.accessibility_rounded),
              ),
            ),
            WhiteCard(
              title: 'add_reaction',
              width: 170,
              child: Center(
                child: Icon(Icons.add_reaction),
              ),
            ),
            WhiteCard(
              title: 'announcement_rounded',
              width: 170,
              child: Center(
                child: Icon(Icons.announcement_rounded),
              ),
            ),
            WhiteCard(
              title: 'play_lesson_rounded',
              width: 170,
              child: Center(
                child: Icon(Icons.play_lesson_rounded),
              ),
            ),
            WhiteCard(
              title: 'wallet_giftcard',
              width: 170,
              child: Center(
                child: Icon(Icons.wallet_giftcard),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
