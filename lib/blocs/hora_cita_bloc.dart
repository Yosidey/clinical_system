import 'package:bloc/bloc.dart';
import 'package:clinical_system/screens/horarios/horarios.dart';
import 'package:clinical_system/services/request/horas/request_horas.dart';

class HorariosBloc extends Bloc<HorariosEvent, HorariosState> {
  @override
  HorariosBloc() : super(HorariosInitialState());

  /// Initial default state
  HorariosState get initialState => HorariosInitialState();

  Stream<HorariosState> mapEventToState(HorariosEvent event) async* {
    if(event is HorariosGetDataEvent){
      try{
        yield HorariosLoadingState();
        final requestHoras = RequestHoras();
        var data = await requestHoras.getHoras(idemedico: event.idemedico,fecha: event.fecha);
        yield HorariosReceivedDataState(listHorarios: data);
        yield HorariosSuccessState();
      }catch(error){
        yield HorariosFailureState(error: error.toString());
      }
    }
  }
}
