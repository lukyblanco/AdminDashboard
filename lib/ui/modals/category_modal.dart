import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/categories_provider.dart';

import 'package:admin_dashboard/models/category.dart';

import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class CategoryModal extends StatefulWidget {
  final Categoria? categoria;
  const CategoryModal({super.key, this.categoria});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  // si el ID viene, esta actualizando, sino esta creando una nueva
  String? id;
  String nombre = '';

  @override
  void initState() {
    super.initState();
    nombre = widget.categoria?.nombre ?? '';
    id = widget.categoria?.id;
  }

  @override
  Widget build(BuildContext context) {
    // instancia del provider
    final categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(20),
      height: 500,
      width: 1000, //!Aca hay un tema, revisar..
      decoration: builBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.categoria?.nombre ?? 'Nueva Categoria',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                  //Boton Cerrar "X"
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ],
          ),
          Divider(
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 20),
          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.loginInputDecoration(
                hint: 'Nombre de la categoría',
                icon: Icons.new_releases_outlined,
                label: 'Categoría'),
            style: const TextStyle(color: Colors.white),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                try {
                  if (id == null) {
                  // creando
                    await categoryProvider.newCategory(nombre);
                    NotificationServices.showSnackBar('$nombre Creado!');
                    

                  } else {
                    // actualizando
                    await categoryProvider.updateCategory(id!, nombre);
                    NotificationServices.showSnackBar('$nombre Actualizado!');

                    
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                  
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                  NotificationServices.showSnackBarErrors('No se pudo guardar la Categoría');
                }
                
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration builBoxDecoration() {
    return const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Color(0xff0F2041),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
          )
        ]);
  }
}
