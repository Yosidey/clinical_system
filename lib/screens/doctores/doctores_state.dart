import 'package:clinical_system/models/doctor/doctor.dart';
import 'package:equatable/equatable.dart';

///***************************************************************************
/// DoctoresState Implementation
///***************************************************************************

abstract class DoctoresState extends Equatable {
  const DoctoresState();

  @override
  List<Object> get props => [];
}

///*************** DoctorInitialState Implementation ***************
class DoctoresInitialState extends DoctoresState {}

///*************** DoctoresLoadingState Implementation ***************
class DoctoresLoadingState extends DoctoresState {}

///*************** DoctoresReceivedDataState Implementation ***************
class DoctoresReceivedDataState extends DoctoresState {
  final List<Doctor> listDoctores;

  const DoctoresReceivedDataState({required this.listDoctores});

  @override
  List<Object> get props => [listDoctores];

  @override
  String toString() => "DoctoresReceivedDataState { listConsultas: $listDoctores }";
}

///*************** DoctoresSuccessState Implementation ***************
class DoctoresSuccessState extends DoctoresState {}

///*************** DoctorsFailureState Implementation ***************
class DoctoresFailureState extends DoctoresState {
  final error;

  const DoctoresFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "DoctoresFailureState { error: $error }";
}
