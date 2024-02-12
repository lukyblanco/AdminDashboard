import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/models/category.dart';
import 'package:admin_dashboard/providers/categories_provider.dart';
import 'package:admin_dashboard/ui/modals/category_modal.dart';

class CategoriesDataTalbleSource extends DataTableSource {
  final List<Categoria> categorias;
  final BuildContext context;

  CategoriesDataTalbleSource(
    this.categorias,
    this.context,
  );

  @override
  //* como se construye una fila... (una fila con sus celdas y los valores (widget) de las celdas)
  DataRow getRow(int index) {
    final categoria = categorias[index];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(categoria.id)),
        DataCell(Text(categoria.nombre)),
        DataCell(Text(categoria.usuario.nombre.toUpperCase())),
        DataCell(Row(
          children: [
            IconButton(
                onPressed: () {
                  // boton EDIT - Modal
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => CategoryModal(categoria: categoria),
                  );
                },
                icon: const Icon(Icons.edit_outlined)),
            IconButton(
              icon: Icon(Icons.delete_outline,
                  color: Colors.red.withOpacity(0.8)),
              onPressed: () {
                final dialog = AlertDialog(
                  title: const Text('Estas seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${categoria.nombre}?'),
                  actions: [
                    TextButton(
                      child: const Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Si'),
                      onPressed: () async {
                        //? aca se elimina la categoria
                        await Provider.of<CategoriesProvider>(context, listen: false)
                            .deleteCategory(categoria.id);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );

                showDialog(
                  // barrierColor: Colors.transparent,
                  context: context,
                  builder: (_) => dialog,
                );
              },
            ),
          ],
        )),
      ],
    );
  }

  @override
  // implement isRowCountApproximate - x si no conozco el numero exacto de elementos en la fila = true,
  // si lo conozco = false
  bool get isRowCountApproximate => false;

  @override
  // mplement rowCount - capturar el error x la cantidad de filas en caso de no saberlas
  int get rowCount => categorias.length;

  @override
  // mplement selectedRowCount
  int get selectedRowCount => 0;
}
