import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
import 'package:clinical_system/models/cita/cita.dart';
import 'package:clinical_system/models/consulta/consulta.dart';
import 'package:clinical_system/models/doctor/doctor.dart';
import 'package:clinical_system/models/especialidad/especialidad.dart';
import 'package:clinical_system/models/fecha/fecha.dart';
import 'package:clinical_system/screens/fechas/fechas.dart';
import 'package:clinical_system/screens/horarios/horarios.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FechasPage extends StatelessWidget {
  const FechasPage({
    required this.cita,
    required this.consulta,
    required this.especialidad,
    required this.doctor,
  });

  final Cita cita;
  final Consulta consulta;
  final Especialidad especialidad;
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FechasBloc()
              ..add(FechasGetDataEvent(
                idMedico: doctor.idMedico,
              ));
          },
        )
      ],
      child: Fechas(
        cita: this.cita,
        consulta: this.consulta,
        especialidad: this.especialidad,
        doctor: this.doctor,
      ),
    );
  }
}

class Fechas extends StatefulWidget {
  Fechas({
    required this.cita,
    required this.consulta,
    required this.especialidad,
    required this.doctor,
  });

  final Cita cita;
  final Consulta consulta;
  final Especialidad especialidad;
  final Doctor doctor;

  @override
  State<Fechas> createState() => _FechasState();
}

class _FechasState extends State<Fechas> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  ///Fecha
  Fecha? _selectedFecha;
  List<DropdownMenuItem<Fecha>> itemsFechasDropdown = <DropdownMenuItem<Fecha>>[];

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
    return BlocListener<FechasBloc, FechasState>(
      listener: (context, state) {
        if (state is FechasInitialState) {}

        if (state is FechasLoadingState) {
          setState(() {
            isLoading = true;
          });
        }

        if (state is FechasReceivedDataState) {
          setState(() {
            _selectedFecha = null;
            itemsFechasDropdown.clear();
            itemsFechasDropdown = state.listFechas.map<DropdownMenuItem<Fecha>>((Fecha entry) {
              return DropdownMenuItem<Fecha>(
                value: entry,
                child: Text(entry.fechas_Disp.toString()),
              );
            }).toList();
          });
        }

        if (state is FechasSuccessState) {
          setState(() {
            isLoading = false;
          });
        }

        if (state is FechasFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
        }
      },
      child: BlocBuilder<FechasBloc, FechasState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Fechas"),
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
                        Text("Fechas disponibles", style: Theme.of(context).textTheme.headline3),
                        const SizedBox(height: 32),
                        Text(
                            " Cita: " +
                                widget.cita.cita +
                                ". Consulta: " +
                                widget.consulta.nombreConsulta +
                                ". Especialidad: " +
                                widget.especialidad.namEspeci +
                                ". Doctor: " +
                                widget.doctor.nomDoctor,
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: 32),
                        Stack(
                          children: [
                            DropdownButtonFormField<Fecha>(
                              decoration: const InputDecoration(
                                labelText: "Selecciona una fecha ",
                                hintText: "\$",
                                border: OutlineInputBorder(),
                              ),
                              items: itemsFechasDropdown,
                              onChanged: (value) {
                                setState(() {
                                  _selectedFecha = value;
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HorariosPage(
                                              cita: widget.cita,
                                              consulta: widget.consulta,
                                              especialidad: widget.especialidad,
                                              doctor: widget.doctor,
                                              fecha: _selectedFecha!,
                                            )));
                              },
                            ),
                            if (isLoading) LoadingIndicator(color: Theme.of(context).primaryColor),
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
