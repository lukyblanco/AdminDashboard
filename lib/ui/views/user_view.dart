import 'package:admin_dashboard/providers/user_form_provider.dart';
import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/usuario.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class UserView extends StatefulWidget {
  final String uid;
  const UserView({super.key, required this.uid});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider =
        Provider.of<UserFormProvider>(context, listen: false);

    //? esto es un Future
    usersProvider.getUserById(widget.uid).then((userDB) {
      if (userDB != null) {
        userFormProvider.user = userDB;
        //*ver episodio 183 en caso de error
        // userFormProvider.formkey = GlobalKey<FormState>();
        setState(() {
          user = userDB;
        });
      } else {
        NavigationService.replaceTo('/dashboard/users');
      }
    });
  }

  @override
  void dispose() {
    user = null;
    Provider.of<UserFormProvider>(context, listen: false).user = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Text(
              'User View',
              style: CustomLabels.h1,
            ),
            const SizedBox(height: 10),
            if (user == null)
              WhiteCard(
                  child: Container(
                alignment: Alignment.center,
                height: 300,
                child: const CircularProgressIndicator(),
              )),
            if (user != null) const _UserViewBody()
          ],
        ));
  }
}

class _UserViewBody extends StatelessWidget {
  const _UserViewBody();

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(250),
        },
        children: [
          TableRow(children: [
            //?Avatar
            _AvatarContainer(),

            //? Formulario de actualización
            const _UserViewForm(),
          ])
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm();

  @override
  Widget build(BuildContext context) {
    //*Buscando la instancia del provider
    final userFormProvider = Provider.of<UserFormProvider>(context);
    //siempre voy a tener un user aca por eso el " ! "
    final user = userFormProvider.user!;

    return WhiteCard(
        title: 'Información General',
        child: Form(
            key: userFormProvider.formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  initialValue: user.nombre,
                  decoration: CustomInputs.formInputDecoration(
                    hint: 'Nombre de Usuario',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_outlined,
                  ),
                  onChanged: (value) =>
                      userFormProvider.copyUserWith(nombre: value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese un nombre';
                    }
                    if (value.length < 2) {
                      return 'Ingrese un nombre completo';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: user.correo,
                  decoration: CustomInputs.formInputDecoration(
                    hint: 'Correo del Usuario',
                    label: 'Corrro',
                    icon: Icons.mark_email_read_outlined,
                  ),
                  onChanged: (value) =>
                      userFormProvider.copyUserWith(correo: value),
                  validator: (value) {
                    if (!EmailValidator.validate(value ?? '')) {
                      return 'Email no valido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: ElevatedButton(
                      onPressed: () async {
                        final saved = await userFormProvider.updateUser();
                        if (saved) {
                          NotificationServices.showSnackBar(
                              'Usuario Actualizado');
                          // ignore: use_build_context_synchronously
                          Provider.of<UsersProvider>(context, listen: false)
                              .refreshUsers(user);
                        } else {
                          NotificationServices.showSnackBarErrors(
                              'Usuario no actualizado');
                        }
                      },
                      style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(Colors.indigo),
                        shadowColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 57, 67, 128)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save_outlined,
                            size: 20,
                          ),
                          Text('Guardar')
                        ],
                      )),
                )
              ],
            )));
  }
}

class _AvatarContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
        width: 250,
        // ignore: sized_box_for_whitespace
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Profile',
                style: CustomLabels.h2,
              ),
              const SizedBox(height: 20),
              // ignore: sized_box_for_whitespace
              Container(
                width: 150,
                height: 160,
                child: Stack(
                  children: [
                    const ClipOval(
                      child: Image(
                        image: AssetImage('no-image.jpg'),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.white, width: 5)),
                        child: FloatingActionButton(
                          backgroundColor: Colors.indigo,
                          elevation: 0,
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // selccionar y cargar imagen
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Text(
                user.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
