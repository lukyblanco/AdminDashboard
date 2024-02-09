import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 40,
      decoration: buildBoxdecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
            hint: 'Buscar', icon: Icons.search_outlined),
      ),
    );
  }

  BoxDecoration buildBoxdecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.withOpacity(0.1),
    );
  }
}



