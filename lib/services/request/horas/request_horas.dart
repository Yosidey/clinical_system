import 'dart:convert';

import 'package:clinical_system/models/horario/horario.dart';
import 'package:clinical_system/services/helpers/apibase_helper.dart';
import 'package:clinical_system/libraries/url_data.dart' as AppData;

///***************************************************************************
/// RequestFechas Implementation
///***************************************************************************
class RequestHoras {
  /// Singleton constructor
  static final RequestHoras _instance = RequestHoras.internal();

  factory RequestHoras() => _instance;

  RequestHoras.internal();

  Future<List<Horario>> getHoras({required String idemedico,required String fecha}) async {
    var hora = Hora(idemedico: idemedico, fecha: fecha);
    String url = AppData.API + AppData.AGENDA_HORAS;
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiPostRequest(jsonEncode(hora));
    print("Body getHoras response:$response");
    List<Horario> data = [];
    if (response != null) {
      data = response.map<Horario>((json) => Horario.fromJson(json)).toList();
    }
    return data;
  }
}
