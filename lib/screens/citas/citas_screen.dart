import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
import 'package:clinical_system/models/cita/cita.dart';
import 'package:clinical_system/models/consulta/consulta.dart';
import 'package:clinical_system/models/doctor/doctor.dart';
import 'package:clinical_system/models/especialidad/especialidad.dart';
import 'package:clinical_system/models/fecha/fecha.dart';
import 'package:clinical_system/models/horario/horario.dart';
import 'package:clinical_system/screens/citas/citas.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitasPage extends StatelessWidget {
   CitasPage({
    required this.cita,
    required this.consulta,
    required this.especialidad,
    required this.doctor,
    required this.fecha,
    required this.horario,
  });
  final Cita cita;
  final Consulta consulta;
  final Especialidad especialidad;
  final Doctor doctor;
  final Fecha fecha;
  final Horario horario;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return CitasBloc();
          },
        )
      ],
      child:  Citas(
        cita: cita,
        consulta: consulta,
        especialidad: especialidad,
        doctor: doctor,
        fecha: fecha,
        horario: horario,
      ),
    );
  }
}

class Citas extends StatefulWidget {
  const Citas({
    required this.cita,
    required this.consulta,
    required this.especialidad,
    required this.doctor,
    required this.fecha,
    required this.horario,
  });
  final Cita cita;
  final Consulta consulta;
  final Especialidad especialidad;
  final Doctor doctor;
  final Fecha fecha;
  final Horario horario;
  @override
  State<Citas> createState() => _CitasState();
}

class _CitasState extends State<Citas> {
  final _formKey = GlobalKey<FormState>();

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
    return BlocListener<CitasBloc, CitasState>(
      listener: (context, state) {
        if (state is CitasInitialState) {}
        if(state is CitasLoadingState){
          setState(() {
            isLoading =true;
          });
        }
        if(state is CitasSuccessState){
          setState(() {
            isLoading =false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Exito"),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
          Navigator.of(context).popUntil((route) => route.isFirst);
        }

        if (state is CitasFailureState) {
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
      child: BlocBuilder<CitasBloc, CitasState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Agenda"),
            ),
            body: Stack(
              children: [
                Center(
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Confirmacion de Cita", style: Theme.of(context).textTheme.headline3),
                            const SizedBox(height: 16),
                            Text("Tipo de Cita: ${widget.cita.cita}", style: Theme.of(context).textTheme.headline4),
                            const SizedBox(height: 8),
                            Text("Fecha: ${widget.fecha.fechas_Disp}", style: Theme.of(context).textTheme.headline4),
                            const SizedBox(height: 8),
                            Text("Horario: ${widget.horario.hora_inicio}", style: Theme.of(context).textTheme.headline4),
                            const SizedBox(height: 8),
                            Text("Doctor: ${widget.doctor.nomDoctor}", style: Theme.of(context).textTheme.headline4),
                            const SizedBox(height: 8),
                            Text("Especialidad: ${widget.especialidad.namEspeci}", style: Theme.of(context).textTheme.headline4),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  BlocProvider.of<CitasBloc>(context).add(
                                    CitasAgendarEvent(
                                    citaData: CitaData(
                                      idepacien: "10",
                                      fechaAgenda: widget.fecha.fechas_Disp,
                                      horaAgenda: widget.horario.hora_inicio,
                                      tipsoli: widget.cita.cita,
                                      tipCons: widget.consulta.idConsulta.toString(),
                                      codprom: widget.doctor.nomDoctor,
                                      codEspe: widget.especialidad.id.toString()
                                    )
                                    ),
                                  );
                                },
                                child: const Text("Confirmar"),
                              ),
                            )
                          ],
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
