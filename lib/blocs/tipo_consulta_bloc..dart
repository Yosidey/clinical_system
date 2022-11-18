import 'package:bloc/bloc.dart';
import 'package:clinical_system/screens/tipo_consulta/tipo_consulta.dart';
import 'package:clinical_system/services/request/consultas/request_consultas.dart';

class TipoConsultaBloc extends Bloc<TipoConsultaEvent, TipoConsultaState> {
  @override
  TipoConsultaBloc() : super(TipoConsultaInitialState());

  /// Initial default state
  TipoConsultaState get initialState => TipoConsultaInitialState();

  Stream<TipoConsultaState> mapEventToState(TipoConsultaEvent event) async* {
    if (event is TipoConsultaGetDataEvent) {
      try {
        yield TipoConsultaLoadingState();
        final requestConsultas = RequestConsultas();
        var data = await requestConsultas.getAllCosultas();
        yield TipoConsultaReceivedDataInitialState(listConsultas: data);
        yield TipoConsultaSuccessState();
      } catch (error) {
        yield TipoConsultaFailureState(error: error.toString());
      }
    }
  }
}
