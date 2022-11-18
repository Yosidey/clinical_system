import 'dart:convert';

import 'package:clinical_system/models/cita/cita.dart';
import 'package:clinical_system/services/helpers/apibase_helper.dart';
import 'package:clinical_system/libraries/url_data.dart' as AppData;

///***************************************************************************
/// RequestCitas Implementation
///***************************************************************************
class RequestCitas {
  /// Singleton constructor
  static final RequestCitas _instance = RequestCitas.internal();

  factory RequestCitas() => _instance;

  RequestCitas.internal();

  Future<void> postAgendarCita({required CitaData citaData}) async {

    String url = AppData.API + AppData.AGENDA_NUEVA_CITA;
      print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiPostRequest(jsonEncode(citaData));
    print("Body postAgendarCita response:$response");

  }
}