import 'package:clinical_system/models/usuario/usuario.dart';
import 'package:equatable/equatable.dart';

///***************************************************************************
/// LoginEvent Implementation
///***************************************************************************
abstract class UsersEvent extends Equatable {
  /// Equatable works only with Final attributes and Const methods
  const UsersEvent();

  List<Object> get props => [];
}

/// **************************************************************************
///  Implementation LoginInEvent
/// **************************************************************************
class LoginInEvent extends UsersEvent {
final UsuarioLogin user;

  const LoginInEvent({required this.user});

  @override
  List<Object> get props => [user, ];

  @override
  String toString() => "LoginInEvent { user: $user}";
}

/// **************************************************************************
///  Implementation RegisterEvent
/// **************************************************************************
class RegisterEvent extends UsersEvent {
  final UsuarioRegister user;

  const RegisterEvent({required this.user});

  @override
  List<Object> get props => [user, ];

  @override
  String toString() => "LoginInEvent { user: $user, }";
}
