import 'package:boring_flutter_app/bloc/article/article_bloc.dart';
import 'package:boring_flutter_app/data/repository/article_repository.dart';
import 'package:boring_flutter_app/ui/login_pages/dashboard_login.dart';
import 'package:boring_flutter_app/ui/pages/dashboard_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cricket',
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample Bloc Flutter"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            builder: (context) =>
                ArticleBloc(repository: ArticleRepositoryImpl()),
          )
        ],
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text("Fetch array from api"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardHome()));
                },
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text("Input Field"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DashboardLogin()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
