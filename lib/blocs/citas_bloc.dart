import 'package:bloc/bloc.dart';
import 'package:clinical_system/screens/citas/citas.dart';
import 'package:clinical_system/services/request/cita/request_cita.dart';

class CitasBloc extends Bloc<CitasEvent, CitasState> {
  @override
  CitasBloc() : super(CitasInitialState());

  /// Initial default state
  CitasState get initialState => CitasInitialState();

  Stream<CitasState> mapEventToState(CitasEvent event) async* {
    if(event is CitasAgendarEvent){
      try{
        yield CitasLoadingState();
        final requestCitas = RequestCitas();
        var data=requestCitas.postAgendarCita(citaData: event.citaData);

        yield CitasSuccessState();
      }catch(error){
        yield CitasFailureState(error: error.toString());
      }
    }
  }
}
