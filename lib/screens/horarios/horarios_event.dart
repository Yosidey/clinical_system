import 'package:equatable/equatable.dart';

///***************************************************************************
/// HorariosEvent Implementation
///***************************************************************************
abstract class HorariosEvent extends Equatable {
  /// Equatable works only with Final attributes and Const methods
  const HorariosEvent();

  List<Object> get props => [];
}
class HorariosGetDataEvent extends HorariosEvent{
  final String idemedico;
  final String fecha;
  HorariosGetDataEvent({required this.idemedico,required this.fecha});
}