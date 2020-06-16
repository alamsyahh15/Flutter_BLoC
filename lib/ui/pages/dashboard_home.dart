import 'package:boring_flutter_app/bloc/article/article_bloc.dart';
import 'package:boring_flutter_app/data/repository/article_repository.dart';
import 'package:boring_flutter_app/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cricket',
      home: BlocProvider(
        builder: (context) => ArticleBloc(repository: ArticleRepositoryImpl()),
        child: HomePage(),
      ),
    );
  }
}
