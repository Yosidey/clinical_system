import 'package:bloc/bloc.dart';
import 'package:clinical_system/screens/tipo_cita/tipo_cita.dart';



class TipoCitaBloc extends Bloc<TipoCitaEvent, TipoCitaState> {
  @override
  TipoCitaBloc() : super(TipoCitaInitialState());

  /// Initial default state
  TipoCitaState get initialState => TipoCitaInitialState();

  Stream<TipoCitaState> mapEventToState(TipoCitaEvent event) async* {}
}