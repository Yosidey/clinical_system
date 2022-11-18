import 'package:bloc/bloc.dart';
import 'package:clinical_system/screens/especialidades/especialidades.dart';
import 'package:clinical_system/services/request/especialidades/request_especialidades.dart';



class EspecialidadesBloc extends Bloc<EspecialidadesEvent, EspecialidadesState> {
  @override
  EspecialidadesBloc() : super(EspecialidadesInitialState());

  /// Initial default state
  EspecialidadesState get initialState => EspecialidadesInitialState();

  Stream<EspecialidadesState> mapEventToState(EspecialidadesEvent event) async* {
    if(event is EspecialidadesGetDataEvent){
      try{
        yield EspecialidadesLoadingState();
        final requestEspecialidades = RequestEspecialidades();
        var data = await requestEspecialidades.getAllEspecialidades();
        yield EspecialidadesReceivedDataState(listEspecialidades: data);
        yield EspecialidadesSuccessState();
      }catch(error){
        yield EspecialidadesFailureState(error: error);
      }
    }
  }
}