import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (BuildContext context) => LoginFormProvider(),
        child: Builder(
          builder: (context) {
            final loginFormProvider = Provider.of<LoginFormProvider>(context);

            return Container(
              margin: const EdgeInsets.only(top: 100),
              // ignore: prefer_const_constructors
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 370,
                  ),
                  child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: loginFormProvider.formkey,
                      child: Column(
                        children: [
                          //? Email
                          TextFormField(
                            validator: (value) {
                              if (!EmailValidator.validate(value ?? '')) {
                                return 'Email no valido';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              loginFormProvider.email = value;
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su correo electronico',
                              label: 'Email',
                              icon: Icons.email_outlined,
                            ),
                          ),

                          const SizedBox(height: 10),

                          //? PassWord
                          TextFormField(
                            onChanged: (value) {
                              loginFormProvider.password = value;
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
                              final isValid = loginFormProvider.validateForm();
                              if (isValid) {
                                authProvider.login(
                                  loginFormProvider.email,
                                  loginFormProvider.password,
                                );
                              }
                            },
                            text: 'Ingresar',
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          LinkText(
                            text: 'Nueva Cuenta',
                            onPressed: () {
                              NavigationService.navigateTo(
                                  Flurorouter.registerRoute);
                              // Navigator.pushNamed(
                              //     context, Flurorouter.registerRoute);
                            },
                          )
                        ],
                      )),
                ),
              ),
            );
          },
        ));
  }
}
