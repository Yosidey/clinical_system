import 'package:clinical_system/models/horario/horario.dart';
import 'package:equatable/equatable.dart';

///***************************************************************************
/// HoraState Implementation
///***************************************************************************

abstract class HorariosState extends Equatable {
  const HorariosState();

  @override
  List<Object> get props => [];
}
///*************** HoraInitialState Implementation ***************
class HorariosInitialState extends HorariosState {}

///*************** DoctoresLoadingState Implementation ***************
class HorariosLoadingState extends HorariosState {}

///*************** HorariosReceivedDataState Implementation ***************
class HorariosReceivedDataState extends HorariosState {
  final List<Horario> listHorarios;

  const HorariosReceivedDataState({required this.listHorarios});

  @override
  List<Object> get props => [listHorarios];

  @override
  String toString() => "HorariosReceivedDataState { listHorarios: $listHorarios }";
}

///*************** DoctoresSuccessState Implementation ***************
class HorariosSuccessState extends HorariosState {}

///*************** HorariosFailureState Implementation ***************
class  HorariosFailureState extends HorariosState {
  final error;

  const HorariosFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "HorariosFailureState { error: $error }";
}