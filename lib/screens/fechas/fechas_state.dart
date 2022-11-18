import 'package:clinical_system/models/fecha/fecha.dart';
import 'package:equatable/equatable.dart';

///***************************************************************************
/// FechaState Implementation
///***************************************************************************

abstract class FechasState extends Equatable {
  const FechasState();

  @override
  List<Object> get props => [];
}
///*************** DateInitialState Implementation ***************
class FechasInitialState extends FechasState {}


///*************** DoctoresLoadingState Implementation ***************
class FechasLoadingState extends FechasState {}

///*************** FechasReceivedDataState Implementation ***************
class FechasReceivedDataState extends FechasState {
  final List<Fecha> listFechas;

  const FechasReceivedDataState({required this.listFechas});

  @override
  List<Object> get props => [listFechas];

  @override
  String toString() => "FechasReceivedDataState { listFechas: $listFechas }";
}

///*************** DoctoresSuccessState Implementation ***************
class FechasSuccessState extends FechasState {}

///*************** DateCitationFailureState Implementation ***************
class FechasFailureState extends FechasState {
  final error;

  const FechasFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "FechasFailureState { error: $error }";
}