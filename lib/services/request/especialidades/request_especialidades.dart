import 'package:clinical_system/models/especialidad/especialidad.dart';
import 'package:clinical_system/services/helpers/apibase_helper.dart';
import 'package:clinical_system/libraries/url_data.dart' as AppData;

///***************************************************************************
/// RequestConsultas Implementation
///***************************************************************************
class RequestEspecialidades {
  /// Singleton constructor
  static final RequestEspecialidades _instance = RequestEspecialidades.internal();

  factory RequestEspecialidades() => _instance;

  RequestEspecialidades.internal();

  Future<List<Especialidad>> getAllEspecialidades() async {

    String url = AppData.API+AppData.AGENDA_ESPECIALIDADES;
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiGetRequest();
    print("Body getAllEspecialidades response:$response");
    List<Especialidad> data = [];
    if (response != null) {
      data = response.map<Especialidad>((json) => Especialidad.fromJson(json)).toList();
    }
    return data;
  }
}
