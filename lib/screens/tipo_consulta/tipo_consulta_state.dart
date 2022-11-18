import 'package:clinical_system/models/consulta/consulta.dart';
import 'package:equatable/equatable.dart';

///***************************************************************************
/// TipoConsultaState Implementation
///***************************************************************************

abstract class TipoConsultaState extends Equatable {
  const TipoConsultaState();

  @override
  List<Object> get props => [];
}

///*************** TipoConsultaInitialState Implementation ***************
class TipoConsultaInitialState extends TipoConsultaState {}

///*************** TipoConsultaLoadingState Implementation ***************
class TipoConsultaLoadingState extends TipoConsultaState {}

///*************** TipoConsultaInitialState Implementation ***************
class TipoConsultaReceivedDataInitialState extends TipoConsultaState {
  final List<Consulta> listConsultas;

  const TipoConsultaReceivedDataInitialState({required this.listConsultas});

  @override
  List<Object> get props => [listConsultas];

  @override
  String toString() => "TipoConsultaReceivedDataInitialState { listConsultas: $listConsultas }";
}

///*************** TipoConsultaSuccessState Implementation ***************
class TipoConsultaSuccessState extends TipoConsultaState {}

///*************** TipoConsultaFailureState Implementation ***************
class TipoConsultaFailureState extends TipoConsultaState {
  final error;

  const TipoConsultaFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "TipoConsultaFailureState { error: $error }";
}
