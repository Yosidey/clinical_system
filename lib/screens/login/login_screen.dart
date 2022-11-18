import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/debugApp.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
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
            return LoginBloc();
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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginInitialState) {}
        if (state is LoginLoadingState) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is LoginReceivedDataState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Inicio de seccion exitoso"),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );

        }
        if (state is LoginSuccessState) {
          setState(() {
            isLoading = false;
          });

          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        }
        if (state is LoginFailureState) {
          setState(() {
            isLoading = false;
            emailController.clear();
            passwordController.clear();
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Login"),
            ),
            body: Stack(
              children: [
                Center(
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Text("Iniciar seccion", style: Theme.of(context).textTheme.headline3),
                                  const SizedBox(height: 32),
                                  TextFormField(
                                    controller: emailController,
                                    decoration: const InputDecoration(
                                      labelText: "Email",
                                      hintText: "Ingresa Email.",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  TextFormField(
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                      labelText: "Password",
                                      hintText: "Ingresa Password.",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: isLoading
                                          ? null
                                          : () {
                                              BlocProvider.of<LoginBloc>(context).add(LoginInEvent(
                                                  email: emailController.text,
                                                  password: passwordController.text));
                                            },
                                      child: const Text("Iniciar seccion"),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => const DebugApp()));
                                      },
                                      child: const Text("Debug"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
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
