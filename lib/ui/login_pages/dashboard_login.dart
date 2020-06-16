import 'package:boring_flutter_app/bloc/login/login_bloc.dart';
import 'package:boring_flutter_app/data/repository/login_repository.dart';
import 'package:boring_flutter_app/ui/login_pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
          builder: (context) => LoginBloc(loginRepo: LoginRepo()),
          child: LoginPage(),
      ),
    );
  }
}
