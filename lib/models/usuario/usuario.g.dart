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

///UsuarioRegister
UsuarioRegister _$UsuarioRegisterFromJson(Map<String, dynamic> json) => UsuarioRegister(
      numeroIdentidad: json['NumeroIdentidad'] as String,
      primerNombre: json['primerNombre'] as String,
      segundoNombre: json['segundoNombre'] as String,
      primerApellido: json['primerApellido'] as String,
      segundoApellido: json['segundoApellido'] as String,
      correo: json['correo'] as String,
      celCliente: json['celCliente'] as String,
      telefono: json['Telefono'] as String,
      contrasena: json['Contrasena'] as String,
    );

Map<String, dynamic> _$UsuarioRegisterToJson(UsuarioRegister instance) => <String, dynamic>{
      'NumeroIdentidad': instance.numeroIdentidad,
      'primerNombre': instance.primerNombre,
      'segundoNombre': instance.segundoNombre,
      'primerApellido': instance.primerNombre,
      'segundoApellido': instance.segundoApellido,
      'correo': instance.correo,
      'celCliente': instance.celCliente,
      'Telefono': instance.telefono,
      'Contrasena': instance.contrasena,
    };

///UsuarioLoginData
UsuarioLoginData _$UsuarioLoginDataFromJson(Map<String, dynamic> json) => UsuarioLoginData(
    exito: json['exito'] as int,
    mensaje: json['mensaje'] as String,
    data: LoginData.fromJson(json['data'] as Map<String, dynamic>));

Map<String, dynamic> _$UsuarioLoginDataToJson(UsuarioLoginData instance) => <String, dynamic>{
      'exito': instance.exito,
      'mensaje': instance.mensaje,
      'data': instance.data,
    };

///UsuarioRegisterData
UsuarioRegisterData _$UsuarioRegisterDataFromJson(Map<String, dynamic> json) => UsuarioRegisterData(
      response: json['response'] as String,
      msg: json['msg'] as int,
      user_id: json['user_id'] as int,
    );

Map<String, dynamic> _$UsuarioRegisterDataToJson(UsuarioRegisterData instance) => <String, dynamic>{
      'response': instance.response,
      'msg': instance.msg,
      'user_id': instance.user_id,
    };

///LoginData
LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      id: json['id'] as int,
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'token': instance.token,
    };
