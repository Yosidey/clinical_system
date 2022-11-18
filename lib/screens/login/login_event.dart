import 'package:equatable/equatable.dart';

///***************************************************************************
/// LoginEvent Implementation
///***************************************************************************
abstract class LoginEvent extends Equatable {
  /// Equatable works only with Final attributes and Const methods
  const LoginEvent();

  List<Object> get props => [];
}

/// **************************************************************************
///  Implementation LoginInEvent
/// **************************************************************************
class LoginInEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => "LoginInEvent { email: $email, password: $password }";
}
