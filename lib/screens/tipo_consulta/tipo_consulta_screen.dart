import 'dart:convert';

import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/libraries/components/loagindIndicator.dart';
import 'package:clinical_system/models/cita/cita.dart';
import 'package:clinical_system/models/consulta/consulta.dart';
import 'package:clinical_system/screens/especialidades/especialidades.dart';
import 'package:clinical_system/screens/tipo_consulta/tipo_consulta.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TipoConsultaPage extends StatelessWidget {
  const TipoConsultaPage({
    required this.cita,
  });

  final Cita cita;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return TipoConsultaBloc()..add(TipoConsultaGetDataEvent());
          },
        )
      ],
      child: TipoConsulta(cita: this.cita),
    );
  }
}

class TipoConsulta extends StatefulWidget {
  TipoConsulta({required this.cita});

  final Cita cita;

  @override
  State<TipoConsulta> createState() => _TipoConsultaState();
}

class _TipoConsultaState extends State<TipoConsulta> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  ///Consulta
  Consulta? _selectedConsulta;
  List<DropdownMenuItem<Consulta>> itemsConsultaDropdown = <DropdownMenuItem<Consulta>>[];

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
    return BlocListener<TipoConsultaBloc, TipoConsultaState>(
      listener: (context, state) {
        if (state is TipoConsultaInitialState) {}
        if (state is TipoConsultaLoadingState) {
          setState(() {
            isLoading = true;
          });
        }
        if (state is TipoConsultaReceivedDataInitialState) {
          setState(() {
            _selectedConsulta = null;
            itemsConsultaDropdown.clear();
            itemsConsultaDropdown =
                state.listConsultas.map<DropdownMenuItem<Consulta>>((Consulta entry) {
              return DropdownMenuItem<Consulta>(
                value: entry,
                child: Text(entry.nombreConsulta.toString()),
              );
            }).toList();
          });
        }
        if (state is TipoConsultaSuccessState) {
          setState(() {
            isLoading = false;
          });
        }
        if (state is TipoConsultaFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
        }
      },
      child: BlocBuilder<TipoConsultaBloc, TipoConsultaState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Consultas"),
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
                        Text("Tipo de Consulta", style: Theme.of(context).textTheme.headline3),
                        const SizedBox(height: 32),
                        Text("Tipo de Cita"+widget.cita.cita, style: Theme.of(context).textTheme.headline6),
                        const SizedBox(height: 32),
                        Stack(
                          children: [
                            DropdownButtonFormField<Consulta>(
                              decoration: const InputDecoration(
                                labelText: 'Selecciona tipo de consulta',
                                border: OutlineInputBorder(),
                              ),
                              items: itemsConsultaDropdown,
                              onChanged: (value) {
                                setState(() {
                                  _selectedConsulta = value;
                                });
                                print(jsonEncode(_selectedConsulta));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EspecialidadesPage(
                                              consulta: _selectedConsulta!,
                                              cita: widget.cita,
                                            )));
                              },
                            ),
                            if (isLoading) LoadingIndicator(color: Theme.of(context).primaryColor)
                          ],
                        )
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
