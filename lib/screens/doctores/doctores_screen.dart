import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
import 'package:clinical_system/models/especialidad/especialidad.dart';
import 'package:clinical_system/models/cita/cita.dart';
import 'package:clinical_system/models/consulta/consulta.dart';
import 'package:clinical_system/models/doctor/doctor.dart';
import 'package:clinical_system/screens/fechas/fechas.dart';
import 'package:clinical_system/screens/doctores/doctores.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({
    required this.cita,
    required this.consulta,
    required this.especialidad,
  });

  final Cita cita;
  final Consulta consulta;
  final Especialidad especialidad;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return DoctoresBloc()..add(DoctoresGetDataEvent(idEspcialidad: especialidad.id));
          },
        )
      ],
      child: Doctors(
        cita: this.cita,
        consulta: this.consulta,
        especialidad: this.especialidad,
      ),
    );
  }
}

class Doctors extends StatefulWidget {
  Doctors({
    required this.cita,
    required this.consulta,
    required this.especialidad,
  });

  final Cita cita;
  final Consulta consulta;
  final Especialidad especialidad;

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  ///Doctor
  Doctor? _selectedDoctor;
  List<DropdownMenuItem<Doctor>> itemsDoctorDropdown = <DropdownMenuItem<Doctor>>[];

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
    return BlocListener<DoctoresBloc, DoctoresState>(
      listener: (context, state) {
        if (state is DoctoresInitialState) {}
        if (state is DoctoresLoadingState) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is DoctoresReceivedDataState) {
          setState(() {
            _selectedDoctor = null;
            itemsDoctorDropdown.clear();
            itemsDoctorDropdown = state.listDoctores.map<DropdownMenuItem<Doctor>>((Doctor entry) {
              return DropdownMenuItem<Doctor>(
                value: entry,
                child: Text(entry.nomDoctor.toString()),
              );
            }).toList();
          });
        }
        if (state is DoctoresSuccessState) {
          setState(() {
            isLoading = false;
          });
        }

        if (state is DoctoresFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
        }
      },
      child: BlocBuilder<DoctoresBloc, DoctoresState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Doctores"),
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
                        Text("Doctores", style: Theme.of(context).textTheme.headline3),
                        const SizedBox(height: 32),
                        Text(
                            " Cita: " +
                                widget.cita.cita +
                                ". Consulta: " +
                                widget.consulta.nombreConsulta +
                                ". Especialidad: " +
                                widget.especialidad.namEspeci,
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: 32),
                        Stack(
                          children: [
                            DropdownButtonFormField<Doctor>(
                              decoration: const InputDecoration(
                                labelText: "Selecciona un Doctor",
                                hintText: "\$",
                                border: OutlineInputBorder(),
                              ),
                              items: itemsDoctorDropdown,
                              onSaved: (value) {},
                              onChanged: (value) {
                                setState(() {
                                  _selectedDoctor = value;
                                });
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) =>  FechasPage(
                                      cita: widget.cita,
                                      consulta: widget.consulta,
                                      especialidad: widget.especialidad,
                                      doctor: _selectedDoctor!,
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
