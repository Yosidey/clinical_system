import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/debugApp.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
import 'package:clinical_system/models/usuario/usuario.dart';
import 'package:clinical_system/screens/home/home.dart';

import 'package:clinical_system/screens/login/login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return UsersBloc();
          },
        )
      ],
      child: Register(),
    );
  }
}

class Register extends StatefulWidget {
  Register();

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final identityNumber = TextEditingController();
  final firstName = TextEditingController();
  final secondName = TextEditingController();
  final firstLastName = TextEditingController();
  final secondLastName = TextEditingController();
  final eMail = TextEditingController();
  final cellPhone = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  bool isLoading = false;

  ///*************** initState ***************
  @override
  void initState() {
    super.initState();
  }

  ///*************** dispose ***************
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      listener: (context, state) {
        if (state is UsersInitialState) {}
        if (state is RegisterLoadingState) {
          setState(() {
            isLoading = true;
          });
        }

        if (state is RegisterSuccessState) {
          setState(() {
            isLoading = false;
          });

          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
        }
        if (state is UserFailureState) {
          setState(() {
            isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
        }
      },
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Login"),
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(64.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Text("Registro de pacientes", style: Theme.of(context).textTheme.headline2),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: identityNumber,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Numero Identidad",
                              hintText: "Ingresa Numero Identidad",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Numero Identidad';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: firstName,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: "Primer Nombre",
                              hintText: "Ingresa Primer Nombre",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Primer Nombre';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: secondName,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: "Segundo Nombre",
                              hintText: "Ingresa Segundo Nombre",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Segundo Nombre';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: firstLastName,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: "Primer Apellido",
                              hintText: "Ingresa Primer Apellido",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Primer Apellido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: secondLastName,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              labelText: "Segundo Apellido",
                              hintText: "Ingresa Segundo Apellido",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Segundo Apellido';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: eMail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: "Correo",
                              hintText: "Ingresa correo",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Correo';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: cellPhone,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Numero de celular",
                              hintText: "Ingresa Numero de celular",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Numero de celular';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              labelText: "Numero de Telefonico",
                              hintText: "Ingresa Numero de Telefonico",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Numero de Telefonico';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: password,
                            decoration: const InputDecoration(
                              labelText: "Contraseña",
                              hintText: "Ingresa Contraseña",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter Contraseña';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<UsersBloc>(context).add(RegisterEvent(
                                            user: UsuarioRegister(
                                                numeroIdentidad: identityNumber.text,
                                                primerNombre: firstName.text,
                                                segundoNombre: firstLastName.text,
                                                primerApellido: firstLastName.text,
                                                segundoApellido: secondLastName.text,
                                                correo: eMail.text,
                                                celCliente: cellPhone.text,
                                                telefono: phone.text,
                                                contrasena: password.text)));
                                      }
                                    },
                              child: const Text("Registrarme"),
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isLoading) LoadingIndicator(color: Theme.of(context).primaryColor)
              ],
            ),
          );
        },
      ),
    );
  }
}
