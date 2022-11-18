import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:clinical_system/libraries/url_data.dart' as Constants;
import 'exceptions.dart';

///***************************************************************************
/// ApiBase
///***************************************************************************

abstract class ApiBase {
  late String serverUrl;
  late Map<String, String> headers;
}

///***************************************************************************
/// ApiService
///***************************************************************************
class ApiService extends ApiBase {
  /// Singleton constructor
  static final ApiService _instance = ApiService._internal();

  factory ApiService(String url, {String? token}) {
    _instance.serverUrl = url;

    /// For the body json
    _instance.headers = {HttpHeaders.contentTypeHeader: 'application/json'};

    if (token != null) {
      /// Add token if existing
      _instance.headers[HttpHeaders.authorizationHeader] = "JWT " + token;
    }

    return _instance;
  }

  factory ApiService.baseUrl(String url, {String? token}) {
    _instance.serverUrl = url;

    /// For the body json
    _instance.headers = {HttpHeaders.contentTypeHeader: 'application/json'};

    if (token != null) {
      /// Add token if existing
      _instance.headers[HttpHeaders.authorizationHeader] = "JWT " + token;
    }

    return _instance;
  }

  ApiService._internal();

  ///*************** apiGetRequest ***************
  Future<dynamic> apiGetRequest() async {
    var responseJson;
    try {
      final response = (headers == null)
          ? await http.get(Uri.parse(serverUrl))
          : await http.get(Uri.parse(serverUrl), headers: headers);
      responseJson = _returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  ///*************** apiPostRequest ***************
  Future<dynamic> apiPostRequest(String body) async {
    var responseJson;
    try {
      final response = (headers == null)
          ? await http.post(Uri.parse(serverUrl), body: body)
          : await http.post(Uri.parse(serverUrl), headers: headers, body: body);

      responseJson = _returnResponse(response);
      print("Status:${response.statusCode}");

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }



  ///*************** apiPutRequest ***************
  Future<dynamic> apiPutRequest(String body) async {
    var responseJson;

    try {
      final response = (headers == null)
          ? await http.put(Uri.parse(serverUrl), body: body)
          : await http.put(Uri.parse(serverUrl), body: body, headers: headers);
      responseJson = _returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  ///*************** apiDeleteRequest ***************
  Future<dynamic> apiDeleteRequest() async {
    var responseJson;

    try {
      final response = (headers == null)
          ? await http.delete(Uri.parse(serverUrl))
          : await http.delete(Uri.parse(serverUrl), headers: headers);
      responseJson = _returnResponse(response);

    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  ///*************** _returnResponse ***************
  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201: // For the POST


        print("##API: Status code -> ${response.statusCode}");

        /// Content-Type http header sent by the server is missing the
        /// encoding tag. This causes the Dart http client to decode the
        /// body as Latin-1 instead of utf-8.
        final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
        return responseJson;

      case 400:
        throw BadRequestException(utf8.decode(response.bodyBytes));
      case 401:
      case 403:
        throw UnauthorizedException(utf8.decode(response.bodyBytes));

      case 500:
        throw FetchDataException(
            'Error occured while Communication with Server with Status code: ${response.statusCode}');
      case 502:
        throw FetchDataException(
            'Bad Gateway with Server with Status code: ${response.statusCode}');
    }
  }
}
