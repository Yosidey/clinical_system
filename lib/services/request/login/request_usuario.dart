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
  Future<UsuarioLoginData> loginUser({required UsuarioLogin user}) async {
    print("user:${jsonEncode(user)}");
    String url = AppData.API + AppData.LOGIN;
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiPostRequest(jsonEncode(user));
    print("Body authenticateUser response:$response");

    var userData = UsuarioLoginData.fromJson(response);

    return userData;
  }

  ///*************** registerUser ***************
  Future<UsuarioRegisterData> registerUser({required UsuarioRegister user}) async {
    String url = "http://desarrollo.steel.net.co/apiaurora/api/registro";
    print(url);

    /// Open API Service
    ApiService apiServer = ApiService(url);

    var response = await apiServer.apiPostRequest(jsonEncode(user));
    print("Body authenticateUser response:$response");

    var userData = UsuarioRegisterData.fromJson(response);

    return userData;
  }
}
