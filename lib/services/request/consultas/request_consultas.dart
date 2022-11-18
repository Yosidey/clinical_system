import 'package:clinical_system/models/consulta/consulta.dart';
import 'package:clinical_system/services/helpers/apibase_helper.dart';
import 'package:clinical_system/libraries/url_data.dart' as AppData;

///***************************************************************************
/// RequestConsultas Implementation
///***************************************************************************
class RequestConsultas {
  /// Singleton constructor
  static final RequestConsultas _instance = RequestConsultas.internal();

  factory RequestConsultas() => _instance;

  RequestConsultas.internal();

  Future<List<Consulta>> getAllCosultas() async {

    String url = AppData.API+AppData.AGENDA_CONSULTAS;
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiGetRequest();
    print("Body getAllCosultas response:$response");
    List<Consulta> data = [];
    if (response != null) {
      data = response.map<Consulta>((json) => Consulta.fromJson(json)).toList();
    }
    return data;
  }
}
