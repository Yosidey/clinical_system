import 'package:clinical_system/blocs/blocs.dart';
import 'package:clinical_system/models/cita/cita.dart';

import 'package:clinical_system/screens/tipo_cita/tipo_cita.dart';

import 'package:clinical_system/screens/tipo_consulta/tipo_consulta.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TipoCitaPage extends StatelessWidget {
  const TipoCitaPage();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return TipoCitaBloc();
          },
        )
      ],
      child: TipoCita(),
    );
  }
}

class TipoCita extends StatefulWidget {
  TipoCita();

  @override
  State<TipoCita> createState() => _TipoCitaState();
}

enum menuOperations { virtual, presencial }

class _TipoCitaState extends State<TipoCita> {
  final _formKey = GlobalKey<FormState>();
  menuOperations? _mItem;
  bool isLoading = false;
  int type = 1;
  Cita? cita;

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
    return BlocListener<TipoCitaBloc, TipoCitaState>(
      listener: (context, state) {
        if (state is TipoCitaInitialState) {}
        if (state is TipoCitaFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error.toString()),
              action: SnackBarAction(label: "Entiendo", onPressed: () {}),
            ),
          );
        }
      },
      child: BlocBuilder<TipoCitaBloc, TipoCitaState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Citas"),
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
                        Text("Tipo de Cita", style: Theme.of(context).textTheme.headline3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                title: const Text("Virtual"),
                                leading: Radio<menuOperations>(
                                  value: menuOperations.virtual,
                                  groupValue: _mItem,
                                  onChanged: (menuOperations? value) {
                                    setState(() {
                                      _mItem = value;
                                      type = 2;
                                      _mItem = null;
                                    });

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>  TipoConsultaPage(cita: Cita(cita: "Virtual"))));
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text("Presencial"),
                                leading: Radio<menuOperations>(
                                  value: menuOperations.presencial,
                                  groupValue: _mItem,
                                  onChanged: (menuOperations? value) {
                                    setState(() {
                                      _mItem = value;
                                      type = 3;
                                      _mItem = null;
                                    });

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>  TipoConsultaPage(cita: Cita(cita: "Presencial"))));
                                  },
                                ),
                              ),
                            ),
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
