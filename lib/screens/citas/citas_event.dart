import 'package:equatable/equatable.dart';
import 'package:clinical_system/models/cita/cita.dart';
///***************************************************************************
/// CitasEvent Implementation
///***************************************************************************
abstract class CitasEvent extends Equatable {
  /// Equatable works only with Final attributes and Const methods
  const CitasEvent();

  List<Object> get props => [];
}

class CitasAgendarEvent extends CitasEvent{
  final CitaData citaData;
  CitasAgendarEvent({required this.citaData});
}