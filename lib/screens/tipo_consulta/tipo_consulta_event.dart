import 'package:equatable/equatable.dart';

///***************************************************************************
/// TipoConsultaEvent Implementation
///***************************************************************************
abstract class TipoConsultaEvent extends Equatable {
  /// Equatable works only with Final attributes and Const methods
  const TipoConsultaEvent();

  List<Object> get props => [];
}

class TipoConsultaGetDataEvent extends TipoConsultaEvent{}