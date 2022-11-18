import 'package:clinical_system/models/doctor/doctor.dart';
import 'package:clinical_system/services/helpers/apibase_helper.dart';
import 'package:clinical_system/libraries/url_data.dart' as AppData;

///***************************************************************************
/// RequestDoctores Implementation
///***************************************************************************
class RequestDoctores {
  /// Singleton constructor
  static final RequestDoctores _instance = RequestDoctores.internal();

  factory RequestDoctores() => _instance;

  RequestDoctores.internal();

  Future<List<Doctor>> getDoctores({required int idEspcialidad}) async {
    String url = AppData.API + AppData.AGENDA_DOCTOR+"?id=$idEspcialidad";
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiGetRequest();
    print("Body getDoctores response:$response");
    List<Doctor> data = [];
    if (response != null) {
      data = response.map<Doctor>((json) => Doctor.fromJson(json)).toList();
    }
    return data;
  }
}
