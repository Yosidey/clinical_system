import 'package:equatable/equatable.dart';

///***************************************************************************
/// TipoCitaState Implementation
///***************************************************************************

abstract class TipoCitaState extends Equatable {
  const TipoCitaState();

  @override
  List<Object> get props => [];
}
///*************** TipoCitaInitialState Implementation ***************
class TipoCitaInitialState extends TipoCitaState {}

///*************** TipoCitaFailureState Implementation ***************
class TipoCitaFailureState extends TipoCitaState {
  final error;

  const TipoCitaFailureState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => "TipoCitaFailureState { error: $error }";
}
