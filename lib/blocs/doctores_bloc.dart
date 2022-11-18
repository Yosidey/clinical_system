import 'package:bloc/bloc.dart';
import 'package:clinical_system/screens/doctores/doctores.dart';
import 'package:clinical_system/services/request/doctores/consultas_doctores.dart';

class DoctoresBloc extends Bloc<DoctoresEvent, DoctoresState> {
  @override
  DoctoresBloc() : super(DoctoresInitialState());

  /// Initial default state
  DoctoresState get initialState => DoctoresInitialState();

  Stream<DoctoresState> mapEventToState(DoctoresEvent event) async* {
    if(event is DoctoresGetDataEvent){
      try{
        yield DoctoresLoadingState();
        final requestDoctores = RequestDoctores();
        var data = await requestDoctores.getDoctores(idEspcialidad: event.idEspcialidad);
        yield DoctoresReceivedDataState(listDoctores: data);
        yield DoctoresSuccessState();
      }catch(error){
        yield DoctoresFailureState(error: error.toString());
      }
    }
  }
}
