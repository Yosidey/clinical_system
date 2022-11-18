import 'package:equatable/equatable.dart';

///***************************************************************************
/// FechasEvent Implementation
///***************************************************************************
abstract class FechasEvent extends Equatable {
  /// Equatable works only with Final attributes and Const methods
  const FechasEvent();

  List<Object> get props => [];
}

class FechasGetDataEvent extends FechasEvent {
  final int idMedico;
  FechasGetDataEvent({required this.idMedico});
}