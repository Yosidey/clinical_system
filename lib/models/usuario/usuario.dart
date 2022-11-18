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

class UsuarioRegister {
  final String numeroIdentidad;
  final String primerNombre;
  final String segundoNombre;
  final String primerApellido;
  final String segundoApellido;
  final String correo;
  final String celCliente;
  final String telefono;
  final String contrasena;

  UsuarioRegister({
    required this.numeroIdentidad,
    required this.primerNombre,
    required this.segundoNombre,
    required this.primerApellido,
    required this.segundoApellido,
    required this.celCliente,
    required this.correo,
    required this.telefono,
    required this.contrasena,
  });

  factory UsuarioRegister.fromJson(Map<String, dynamic> json) => _$UsuarioRegisterFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioRegisterToJson(this);
}

class UsuarioRegisterData {
  final String response;
  final int msg;
  final int user_id;

  UsuarioRegisterData({required this.response, required this.msg, required this.user_id});

  factory UsuarioRegisterData.fromJson(Map<String, dynamic> json) => _$UsuarioRegisterDataFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioRegisterDataToJson(this);
}
class UsuarioLoginData {
  final int exito;
  final String mensaje;
  final LoginData data;

  UsuarioLoginData({required this.exito, required this.mensaje, required this.data});

  factory UsuarioLoginData.fromJson(Map<String, dynamic> json) => _$UsuarioLoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioLoginDataToJson(this);
}

class LoginData {
  final int id;
  final String email;
  final String token;

  LoginData({required this.id,required this.email, required this.token});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

class Usuario {
  Usuario();

  static UsuarioLoginData user = UsuarioLoginData(exito: 0, mensaje: "", data: LoginData(id: 1,email: "", token: ""));

  UsuarioLoginData getUser() {
    return user;
  }

  setUser({required UsuarioLoginData userData}) {
    user = userData;
  }
}
