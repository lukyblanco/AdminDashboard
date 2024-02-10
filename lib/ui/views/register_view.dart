import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';

import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 50),
            // ignore: prefer_const_constructors
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 370,
                ),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: registerFormProvider.formkey,
                    child: Column(
                      children: [
                        //? NOMBRE
                        TextFormField(
                          onChanged: (value) {
                            registerFormProvider.name = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'El nombre es obligatorio';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su Nombre',
                            label: 'Nombre',
                            icon: Icons.supervised_user_circle_sharp,
                          ),
                        ),

                        const SizedBox(height: 10),

                        //? EMAIL
                        TextFormField(
                          onChanged: (value) {
                            registerFormProvider.email = value;
                          },
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'Email no valido';
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su correo electronico',
                            label: 'Email',
                            icon: Icons.email_outlined,
                          ),
                        ),

                        const SizedBox(height: 10),

                        ///? PASSWORD
                        TextFormField(
                          onChanged: (value) {
                            registerFormProvider.password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su contraseña';
                            }
                            if (value.length < 6) {
                              return 'La contrasela debe ser de 6 caracteres o mas';
                            }
                            return null; //esto significa que el formulario es valido
                          },
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                            hint: 'Ingrese su Contraseña',
                            label: '*****',
                            icon: Icons.lock_outline_rounded,
                          ),
                        ),

                        const SizedBox(height: 20),

                        CustomOutlinedButton(
                          onPressed: () {
                            final validForm =
                                registerFormProvider.validateForm();
                            if (validForm) {
                              final authProvider = Provider.of<AuthProvider>(
                                  context,
                                  listen: false);
                              authProvider.register(
                                registerFormProvider.email,
                                registerFormProvider.password,
                                registerFormProvider.name,
                              );
                            }
                          },
                          text: 'Crear Cuenta',
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        LinkText(
                          text: 'Ir al Login',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Flurorouter.loginRoute);
                          },
                        )
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}
