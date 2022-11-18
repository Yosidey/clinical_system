import 'dart:convert';

import 'package:clinical_system/models/usuario/usuario.dart';
import 'package:clinical_system/services/helpers/apibase_helper.dart';
import 'package:clinical_system/libraries/url_data.dart' as AppData;

///***************************************************************************
/// RequestUser Implementation
///***************************************************************************
class RequestUser {
  /// Singleton constructor
  static final RequestUser _instance = RequestUser.internal();

  factory RequestUser() => _instance;

  RequestUser.internal();

  ///*************** authenticateUser ***************
  Future<UsuarioData> authenticateUser({required String correo, required String password}) async {
    var user = UsuarioLogin(correo: correo, password: password);
    print("user:${jsonEncode(user)}");
    String url = AppData.API+AppData.LOGIN;
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiPostRequest(jsonEncode(user));
    print("Body authenticateUser response:$response");


    var userData = UsuarioData.fromJson(response);

    return userData;
  }

  ///*************** registerUser ***************
  Future<UsuarioData> registerUser({required String correo, required String password}) async {
    var user = UsuarioLogin(correo: correo, password: password);
    print("user:${jsonEncode(user)}");
    String url = AppData.API+AppData.REGISTER;
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiPostRequest(jsonEncode(user));
    print("Body authenticateUser response:$response");


    var userData = UsuarioData.fromJson(response);

    return userData;
  }
}
