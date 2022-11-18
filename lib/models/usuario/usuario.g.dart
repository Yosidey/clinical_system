part of 'usuario.dart';

///UserLogin
UsuarioLogin _$UsuarioLoginFromJson(Map<String, dynamic> json) => UsuarioLogin(
      correo: json['correo'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UsuarioLoginToJson(UsuarioLogin instance) => <String, dynamic>{
      'correo': instance.correo,
      'password': instance.password,
    };

///UserData
UsuarioData _$UsuarioDataFromJson(Map<String, dynamic> json) => UsuarioData(
    exito: json['exito'] as int,
    mensaje: json['mensaje'] as String,
    data: LoginData.fromJson(json['data'] as Map<String, dynamic>));

Map<String, dynamic> _$UsuarioDataToJson(UsuarioData instance) => <String, dynamic>{
      'exito': instance.exito,
      'mensaje': instance.mensaje,
      'data': instance.data,
    };

///LoginData
LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'email': instance.email,
      'token': instance.token,
    };
