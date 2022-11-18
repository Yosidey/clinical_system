import 'package:json_annotation/json_annotation.dart';

///***************************************************************************
/// UserLogin
///***************************************************************************
part 'usuario.g.dart';

@JsonSerializable()
class UsuarioLogin {
  final String correo;
  final String password;

  UsuarioLogin({required this.correo, required this.password});

  factory UsuarioLogin.fromJson(Map<String, dynamic> json) => _$UsuarioLoginFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioLoginToJson(this);
}

class UsuarioData {
  final int exito;
  final String mensaje;
  final LoginData data;

  UsuarioData({required this.exito, required this.mensaje, required this.data});

  factory UsuarioData.fromJson(Map<String, dynamic> json) => _$UsuarioDataFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioDataToJson(this);
}

class LoginData {
  final String email;
  final String token;

  LoginData({required this.email, required this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

class Usuario {
  Usuario();

  static UsuarioData user = UsuarioData(exito: 0, mensaje: "", data: LoginData(email: "", token: ""));

  UsuarioData getCash() {
    return user;
  }

  setUser(UsuarioData userData) {
    user = userData;
  }
}
