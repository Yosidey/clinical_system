import 'package:equatable/equatable.dart';

///***************************************************************************
/// LoginState Implementation
///***************************************************************************

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

///*************** LoginInitialState Implementation ***************
class UsersInitialState extends UsersState {}

///*************** LoginLoading Implementation ***************
class LoginLoadingState extends UsersState {}

///*************** LoginSuccessState Implementation ***************
class LoginSuccessState extends UsersState {}

///*************** RegisterLoadingState Implementation ***************
class RegisterLoadingState extends UsersState {}

///*************** RegisterSuccessState Implementation ***************
class RegisterSuccessState extends UsersState {}

///*************** UserFailureState Implementation ***************
class UserFailureState extends UsersState {
  final error;

  const UserFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "UserFailureState { error: $error }";
}
