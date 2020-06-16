import 'package:boring_flutter_app/bloc/login/login_bloc.dart';
import 'package:boring_flutter_app/bloc/login/login_event.dart';
import 'package:boring_flutter_app/bloc/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc;
  TextEditingController cUsername = TextEditingController();
  TextEditingController cPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Input Field"),
              ),
              body: SingleChildScrollView(
                child: Container(
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.error),
                          ),
                        );
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if (state is LoginInitial) {
                          return buildForm();
                        } else if (state is LoginProgress) {
                          return buildForm();
                        } else if (state is LoginSuccess) {
                          return successLogin(
                              state.myusername, state.mypassword);
                        } else {
                          return buildForm();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget successLogin(myUsername, myPassword) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("Username nya adalah $myUsername"),
          Text("Password nya adalah $myPassword"),
        ],
      ),
    );
  }

  Widget buildForm() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: cUsername,
            decoration: InputDecoration(hintText: "username"),
          ),
          TextFormField(
            controller: cPassword,
            obscureText: true,
            decoration: InputDecoration(hintText: "password"),
          ),
          loginBloc.isLoading == false
              ? RaisedButton(
                  child: Text("Login"),
                  onPressed: () {
                    loginBloc.add(LoginButtonPressed(
                        password: cPassword.text, username: cUsername.text));
                  },
                )
              : Container(
                  margin: EdgeInsets.only(top: 16),
                  child: CircularProgressIndicator(),
                )
        ],
      ),
    );
  }
}
