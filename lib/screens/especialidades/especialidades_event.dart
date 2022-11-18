import 'package:equatable/equatable.dart';

///***************************************************************************
/// SpecialtiesEvent Implementation
///***************************************************************************
abstract class EspecialidadesEvent extends Equatable {
  /// Equatable works only with Final attributes and Const methods
  const EspecialidadesEvent();

  List<Object> get props => [];
}

class EspecialidadesGetDataEvent extends EspecialidadesEvent{}