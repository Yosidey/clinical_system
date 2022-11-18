import 'package:bloc/bloc.dart';
import 'package:clinical_system/screens/fechas/fechas.dart';
import 'package:clinical_system/services/request/fechas/request_fechas.dart';

class FechasBloc extends Bloc<FechasEvent, FechasState> {
  @override
  FechasBloc() : super(FechasInitialState());

  /// Initial default state
  FechasState get initialState => FechasInitialState();

  Stream<FechasState> mapEventToState(FechasEvent event) async* {
    if(event is FechasGetDataEvent){
      try{
        yield FechasLoadingState();
        final requestFechas = RequestFechas();
        var data = await requestFechas.getFechas(idMedico: event.idMedico);
        yield FechasReceivedDataState(listFechas: data);
        yield FechasSuccessState();
      }catch(error){
        yield FechasFailureState(error: error.toString());
      }
    }
  }
}
