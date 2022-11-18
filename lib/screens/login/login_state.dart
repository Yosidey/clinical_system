import 'package:equatable/equatable.dart';

///***************************************************************************
/// LoginState Implementation
///***************************************************************************

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

///*************** LoginInitialState Implementation ***************
class LoginInitialState extends LoginState {}

///*************** LoginLoading Implementation ***************
class LoginLoadingState extends LoginState {}

///*************** LoginSuccessState Implementation ***************
class LoginReceivedDataState extends LoginState {
  final String token;

  const LoginReceivedDataState({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => "LoginReceivedDataState { token: $token }";
}

///*************** LoginSuccessState Implementation ***************
class LoginSuccessState extends LoginState {}

///*************** RegisterLoadingState Implementation ***************
class RegisterLoadingState extends LoginState {}

///*************** RegisterReceivedDataState Implementation ***************
class RegisterReceivedDataState extends LoginState {
  final String token;

  const RegisterReceivedDataState({required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => "RegisterReceivedDataState { token: $token }";
}

///*************** RegisterSuccessState Implementation ***************
class RegisterSuccessState extends LoginState {}

///*************** LoginFailure Implementation ***************
class LoginFailureState extends LoginState {
  final error;

  const LoginFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "LoginFailureState { error: $error }";
}
