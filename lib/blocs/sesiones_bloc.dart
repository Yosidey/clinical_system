import 'package:bloc/bloc.dart';
import 'package:clinical_system/models/usuario/usuario.dart';
import 'package:clinical_system/screens/login/login.dart';
import 'package:clinical_system/services/request/login/request_usuario.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginBloc() : super(LoginInitialState());

  /// Initial default state
  LoginState get initialState => LoginInitialState();

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInEvent) {
      try {
        yield LoginLoadingState();
        final requestUser = RequestUser();
        var data = await requestUser.authenticateUser(correo: event.email, password: event.password);
        final Usuario user = Usuario();
        user.setUser(data);
        yield LoginReceivedDataState(token: user.getCash().data.token);
        yield LoginSuccessState();
      } catch (error) {
        yield LoginFailureState(error: error.toString());
      }
    }
  }
}
