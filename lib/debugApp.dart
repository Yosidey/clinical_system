import 'package:flutter/material.dart';
import 'package:clinical_system/services/request/cita/request_citas.dart';
import 'package:clinical_system/services/request/consultas/request_consultas.dart';
import 'package:clinical_system/services/request/doctores/request_doctores.dart';
import 'package:clinical_system/services/request/especialidades/request_especialidades.dart';
import 'package:clinical_system/services/request/fechas/request_fechas.dart';
import 'package:clinical_system/services/request/horas/request_horas.dart';
import 'package:clinical_system/services/request/login/request_usuario.dart';
import 'package:clinical_system/models/cita/cita.dart';
import 'package:clinical_system/models/usuario/usuario.dart';

class DebugApp extends StatefulWidget {
  const DebugApp({Key? key}) : super(key: key);

  @override
  State<DebugApp> createState() => _DebugAppState();
}

class _DebugAppState extends State<DebugApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 5,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        children: [
          ElevatedButton(
            onPressed: () async {
              final requestUser = RequestUser();
              var data = await requestUser.loginUser(user: UsuarioLogin(correo: "asdf@gmail.com", password: "asdf"));
            },
            child: const Text("authenticateUser"),
          ),
          ElevatedButton(
            onPressed: () async {
              final requestUser = RequestUser();
              var data = await requestUser.registerUser(user: UsuarioRegister(
                  numeroIdentidad: "1234567890",
                  primerNombre: "juliana",
                  segundoNombre: "juliana",
                  primerApellido: "ramirez",
                  segundoApellido: "ramirez",
                  correo: "1camilajavier1@gmail.com",
                  celCliente: "23445464141",
                  telefono: "4534544563",
                  contrasena: "da5645645624"
              ));
            },
            child: const Text("authenticateUser"),
          ),
          ElevatedButton(
            onPressed: () async {
              final requestConsultas = RequestConsultas();
              var data = await requestConsultas.getAllCosultas();
            },
            child: const Text("getAllCosultas"),
          ),
          ElevatedButton(
            onPressed: () async {
              final requestEspecialidades = RequestEspecialidades();
              var data = await requestEspecialidades.getAllEspecialidades();
            },
            child: const Text("getAllEspecialidades"),
          ),
          ElevatedButton(
            onPressed: () async {
              final requestDoctores = RequestDoctores();
              var data = await requestDoctores.getDoctores(idEspcialidad: 10);
            },
            child: const Text("getDoctores"),
          ),
          ElevatedButton(
            onPressed: () async {
              final requestFechas = RequestFechas();
              var data = await requestFechas.getFechas(idMedico: 147);
            },
            child: const Text("getFechas"),
          ),
          ElevatedButton(
            onPressed: () async {
              final requestHoras = RequestHoras();
              var data = await requestHoras.getHoras(fecha: "13/12/2022 0:00:00", idemedico: "147");
            },
            child: const Text("getHoras"),
          ),
          ElevatedButton(
            onPressed: () async {
              final requestCitas = RequestCitas();
              var data = await requestCitas.postAgendarCita(
                  citaData: CitaData(
                idepacien: "10",
                fechaAgenda: "19/11/2022",
                horaAgenda: "9:30",
                tipsoli: "v",
                tipCons: "1",
                codprom: "dolly",
                codEspe: "10",
              ));
            },
            child: const Text("postAgendarCita"),
          ),
        ],
      ),
    );
  }
}
