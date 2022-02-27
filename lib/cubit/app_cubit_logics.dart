// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trip_app_cubit_api/cubit/app_cubit.dart';

import '../pages/detail_page.dart';
import '../pages/home_page.dart';
import '../pages/nav_pages/main_page.dart';
import '../pages/wellcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is AppWelcomeState) {
            return WelcomePage();
          } else if (state is LoadedState) {
            return MainPage();
          } else if (state is DetailState) {
            return DetailPage();
          } else if (state is LoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        },
      ),
    );
  }
}
