import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
import 'package:clinical_system/models/cita/cita.dart';
import 'package:clinical_system/models/consulta/consulta.dart';
import 'package:clinical_system/models/especialidad/especialidad.dart';
import 'package:clinical_system/screens/doctores/doctores.dart';
import 'package:clinical_system/screens/especialidades/especialidades.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EspecialidadesPage extends StatelessWidget {
  EspecialidadesPage({
    required this.consulta,
    required this.cita,
  });

  final Cita cita;
  final Consulta consulta;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return EspecialidadesBloc()..add(EspecialidadesGetDataEvent());
          },
        )
      ],
      child: Especialidades(
        consulta: this.consulta,
        cita: this.cita,
      ),
    );
  }
}

class Especialidades extends StatefulWidget {
  const Especialidades({required this.consulta, required this.cita,});

  final Consulta consulta;
  final Cita cita;

  @override
  State<Especialidades> createState() => _EspecialidadesState();
}

class _EspecialidadesState extends State<Especialidades> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  ///Consulta
  Especialidad? _selectedEspecialidad;
  List<DropdownMenuItem<Especialidad>> itemsEspecialidadDropdown = <DropdownMenuItem<Especialidad>>[];

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
    return BlocListener<EspecialidadesBloc, EspecialidadesState>(
      listener: (context, state) {
        if (state is EspecialidadesInitialState) {}

        if (state is EspecialidadesLoadingState) {
          setState(() {
            isLoading = true;
          });
        }

        if (state is EspecialidadesReceivedDataState) {
          setState(() {
            _selectedEspecialidad = null;
            itemsEspecialidadDropdown.clear();
            itemsEspecialidadDropdown =
                state.listEspecialidades.map<DropdownMenuItem<Especialidad>>((Especialidad entry) {
              return DropdownMenuItem<Especialidad>(
                value: entry,
                child: Text(entry.namEspeci.toString()),
              );
            }).toList();
          });
          print("EspecialidadesReceivedDataInitialState");
        }

        if (state is EspecialidadesSuccessState) {
          setState(() {
            isLoading = false;
          });
        }

        if (state is EspecialidadesFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
        }
      },
      child: BlocBuilder<EspecialidadesBloc, EspecialidadesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Especialidades"),
            ),
            body: Center(
              child: Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Especialidades", style: Theme.of(context).textTheme.headline3),
                        const SizedBox(height: 32),
                        Text(
                            " Cita: " +
                                widget.cita.cita +
                                ". Consulta: " +
                                widget.consulta.nombreConsulta,
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: 32),
                        Stack(
                          children: [
                            DropdownButtonFormField<Especialidad>(
                              decoration: const InputDecoration(
                                labelText: "Selecciona Especialidad",
                                hintText: "\$",
                                border: OutlineInputBorder(),
                              ),
                              items: itemsEspecialidadDropdown,
                              onSaved: (value) {},
                              onChanged: (value) {
                                setState(() {
                                  _selectedEspecialidad = value;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorsPage(
                                              cita: widget.cita,
                                              consulta: widget.consulta,
                                              especialidad: _selectedEspecialidad!,
                                            )));
                              },
                            ),
                            if (isLoading) LoadingIndicator(color: Theme.of(context).primaryColor)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
