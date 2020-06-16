import 'package:boring_flutter_app/bloc/login/login_event.dart';
import 'package:boring_flutter_app/bloc/login/login_state.dart';
import 'package:boring_flutter_app/data/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo loginRepo;
  LoginBloc({@required this.loginRepo});
  bool isLoading = false;

  @override
  // TODO: implement initialState
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LoginButtonPressed) {
      isLoading = true;
      yield LoginProgress();
      try {
        var result =
            await loginRepo.requestLogin(event.username, event.password);
        print("Result $result");
        if (result != null) {
          isLoading = false;
          yield LoginSuccess(mypassword: result['password'], myusername: result['username']);
        } else {
          isLoading = false;
          yield LoginFailure(error: "Error Username or password is wrong !!");
        }
      } catch (error) {
        isLoading = false;
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
