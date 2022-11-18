import 'package:equatable/equatable.dart';

///***************************************************************************
/// DoctoresEvent Implementation
///***************************************************************************
abstract class DoctoresEvent extends Equatable {
  /// Equatable works only with Final attributes and Const methods
  const DoctoresEvent();

  List<Object> get props => [];
}

class DoctoresGetDataEvent extends DoctoresEvent {
  final int idEspcialidad;
  DoctoresGetDataEvent({required this.idEspcialidad});
}
