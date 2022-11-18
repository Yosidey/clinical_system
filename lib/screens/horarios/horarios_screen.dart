import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
import 'package:clinical_system/models/cita/cita.dart';
import 'package:clinical_system/models/consulta/consulta.dart';
import 'package:clinical_system/models/doctor/doctor.dart';
import 'package:clinical_system/models/especialidad/especialidad.dart';
import 'package:clinical_system/models/fecha/fecha.dart';
import 'package:clinical_system/models/horario/horario.dart';
import 'package:clinical_system/screens/citas/citas.dart';
import 'package:clinical_system/screens/horarios/horarios.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HorariosPage extends StatelessWidget {
  const HorariosPage({
    required this.cita,
    required this.consulta,
    required this.especialidad,
    required this.doctor,
    required this.fecha,
  });

  final Cita cita;
  final Consulta consulta;
  final Especialidad especialidad;
  final Doctor doctor;
  final Fecha fecha;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return HorariosBloc()
              ..add(HorariosGetDataEvent(
                idemedico: doctor.idMedico.toString(),
                fecha: fecha.fechas_Disp,
              ));
          },
        )
      ],
      child: Horarios(
        cita: cita,
        consulta: consulta,
        especialidad: especialidad,
        doctor: doctor,
        fecha: fecha,
      ),
    );
  }
}

class Horarios extends StatefulWidget {
  Horarios({
    required this.cita,
    required this.consulta,
    required this.especialidad,
    required this.doctor,
    required this.fecha,
  });

  final Cita cita;
  final Consulta consulta;
  final Especialidad especialidad;
  final Doctor doctor;
  final Fecha fecha;

  @override
  State<Horarios> createState() => _HorariosState();
}

class _HorariosState extends State<Horarios> {
  final _formKey = GlobalKey<FormState>();

  /// Horario
  Horario? _selectedHorario;
  List<DropdownMenuItem<Horario>> itemsHorarioDropdown = <DropdownMenuItem<Horario>>[];
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
    return BlocListener<HorariosBloc, HorariosState>(
      listener: (context, state) {
        if (state is HorariosInitialState) {}
        if (state is HorariosLoadingState) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is HorariosReceivedDataState) {
          setState(() {
            _selectedHorario = null;
            itemsHorarioDropdown.clear();
            itemsHorarioDropdown = state.listHorarios.map<DropdownMenuItem<Horario>>((Horario entry) {
              return DropdownMenuItem<Horario>(
                value: entry,
                child: Text(entry.hora_inicio.toString()),
              );
            }).toList();
          });
        }
        if (state is HorariosSuccessState) {
          setState(() {
            isLoading = false;
          });
        }

        if (state is HorariosFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
        }
      },
      child: BlocBuilder<HorariosBloc, HorariosState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Horarios"),
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
                            Text("Horario disponible", style: Theme.of(context).textTheme.headline3),
                            const SizedBox(height: 32),
                            Text(
                                " Cita: " +
                                    widget.cita.cita +
                                    ". Consulta: " +
                                    widget.consulta.nombreConsulta +
                                    ". Especialidad: " +
                                    widget.especialidad.namEspeci +
                                    ". Doctor: " +
                                    widget.doctor.nomDoctor +
                                    ". Fecha: " +
                                    widget.fecha.fechas_Disp,
                                style: Theme.of(context).textTheme.headline6),
                            const SizedBox(height: 32),
                            Stack(
                              children: [
                                DropdownButtonFormField<Horario>(
                                  decoration: const InputDecoration(
                                    labelText: "Selecciona un Horario ",
                                    hintText: "\$",
                                    border: OutlineInputBorder(),
                                  ),
                                  items: itemsHorarioDropdown,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedHorario = value;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CitasPage(
                                                  cita: widget.cita,
                                                  consulta: widget.consulta,
                                                  especialidad: widget.especialidad,
                                                  doctor: widget.doctor,
                                                  fecha: widget.fecha,
                                                  horario: _selectedHorario!,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
