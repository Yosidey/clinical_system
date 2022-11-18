import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/debugApp.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
import 'package:clinical_system/models/usuario/usuario.dart';
import 'package:clinical_system/screens/home/home.dart';
import 'package:clinical_system/screens/tipo_cita/tipo_cita.dart';
import 'package:clinical_system/screens/login/login.dart';
import 'package:clinical_system/screens/tipo_consulta/tipo_consulta.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();

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
      child: const Login(),
    );
  }
}

class Login extends StatefulWidget {
  const Login();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  ///*************** initState ***************
  @override
  void initState() {
    emailController.text = "asdf@gmail.com";
    passwordController.text = "asdf";
    super.initState();
  }

  ///*************** dispose ***************
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      listener: (context, state) {
        if (state is UsersInitialState) {}
        if (state is LoginLoadingState) {
          setState(() {
            isLoading = true;
          });
        }

        if (state is LoginSuccessState) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Inicio de seccion exitoso"),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
        }
        if (state is UserFailureState) {
          setState(() {
            isLoading = false;
            /*emailController.clear();
            passwordController.clear();*/
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
                          Text("Iniciar seccion", style: Theme.of(context).textTheme.headline2),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              hintText: "Ingresa Email.",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: "Ingresa Password.",
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
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
                                      /// Validate
                                      if (_formKey.currentState!.validate()) {
                                        /// Call handler after validation
                                        BlocProvider.of<UsersBloc>(context).add(LoginInEvent(
                                            user: UsuarioLogin(
                                                correo: emailController.text,
                                                password: passwordController.text)));
                                      }
                                    },
                              child: const Text("Iniciar seccion"),
                            ),
                          ),
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
