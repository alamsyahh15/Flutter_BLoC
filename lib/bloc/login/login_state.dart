import 'package:boring_flutter_app/data/model/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String myusername;
  final String mypassword;
  LoginSuccess({this.myusername, this.mypassword});
  @override
  // TODO: implement props
  List<Object> get props => [myusername, mypassword];
}

class LoginProgress extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
