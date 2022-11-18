
import 'package:clinical_system/models/especialidad/especialidad.dart';
import 'package:equatable/equatable.dart';

///***************************************************************************
/// SpecialtiesState Implementation
///***************************************************************************

abstract class EspecialidadesState extends Equatable {
  const EspecialidadesState();

  @override
  List<Object> get props => [];
}

///*************** SpecialtiesInitialState Implementation ***************
class EspecialidadesInitialState extends EspecialidadesState {}

///*************** TipoConsultaLoadingState Implementation ***************
class EspecialidadesLoadingState extends EspecialidadesState {}

///*************** EspecialidadesReceivedDataState Implementation ***************
class EspecialidadesReceivedDataState extends EspecialidadesState {
  final List<Especialidad> listEspecialidades;

  const EspecialidadesReceivedDataState({required this.listEspecialidades});

  @override
  List<Object> get props => [listEspecialidades];

  @override
  String toString() => "EspecialidadesReceivedDataState { listConsultas: $listEspecialidades }";
}

///*************** TipoConsultaSuccessState Implementation ***************
class EspecialidadesSuccessState extends EspecialidadesState {}

///*************** QueryTypeFailureState Implementation ***************
class EspecialidadesFailureState extends EspecialidadesState {
  final error;

  const EspecialidadesFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "EspecialidadesFailureState { error: $error }";
}
