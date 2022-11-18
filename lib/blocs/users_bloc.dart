import 'package:bloc/bloc.dart';
import 'package:clinical_system/models/usuario/usuario.dart';
import 'package:clinical_system/screens/login/login.dart';
import 'package:clinical_system/services/request/login/request_usuario.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  @override
  UsersBloc() : super(UsersInitialState());

  /// Initial default state
  UsersState get initialState => UsersInitialState();

  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is LoginInEvent) {
      try {
        yield LoginLoadingState();
        final requestUser = RequestUser();
        var data = await requestUser.loginUser(user: event.user);
        final Usuario user = Usuario();
        user.setUser(userData: data);
        print("Id ${user.getUser().data.id}");

        yield LoginSuccessState();
      } catch (error) {
        yield UserFailureState(error: error.toString());
      }
    }
    if (event is RegisterEvent) {
      try {
        yield RegisterLoadingState();
        final requestUser = RequestUser();
        var data = await requestUser.registerUser(user: event.user);
        final Usuario user = Usuario();

        yield RegisterSuccessState();
      } catch (error) {
        yield UserFailureState(error: error.toString());
      }
    }
  }
}
