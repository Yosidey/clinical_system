import 'package:equatable/equatable.dart';

///***************************************************************************
/// CitasState Implementation
///***************************************************************************

abstract class CitasState extends Equatable {
  const CitasState();

  @override
  List<Object> get props => [];
}
///*************** CitasInitialState Implementation ***************
class CitasInitialState extends CitasState {}
///*************** CitasLoadingState Implementation ***************
class CitasLoadingState extends CitasState {}
///*************** CitasSuccessState Implementation ***************
class CitasSuccessState extends CitasState {}

///*************** CitasFailureState Implementation ***************
class  CitasFailureState extends CitasState {
  final error;

  const CitasFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "CitasFailureState { error: $error }";
}