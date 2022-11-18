import 'package:clinical_system/models/fecha/fecha.dart';
import 'package:clinical_system/services/helpers/apibase_helper.dart';
import 'package:clinical_system/libraries/url_data.dart' as AppData;

///***************************************************************************
/// RequestFechas Implementation
///***************************************************************************
class RequestFechas {
  /// Singleton constructor
  static final RequestFechas _instance = RequestFechas.internal();

  factory RequestFechas() => _instance;

  RequestFechas.internal();

  Future<List<Fecha>> getFechas({required int idMedico}) async {
    String url = AppData.API + AppData.AGENDA_FECHAS+"?id=$idMedico";
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiGetRequest();
    print("Body getFechas response:$response");
    List<Fecha> data = [];
    if (response != null) {
      data = response.map<Fecha>((json) => Fecha.fromJson(json)).toList();
    }
    return data;
  }
}
