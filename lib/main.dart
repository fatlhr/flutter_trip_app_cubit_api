import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_trip_app_cubit_api/cubit/app_cubit_logics.dart';

import 'cubit/app_cubit.dart';
import 'pages/detail_page.dart';
import 'pages/nav_pages/main_page.dart';
import 'pages/wellcome_page.dart';
import 'services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AppCubit(
          data: DataServices(),
        ),
        child: const AppCubitLogics(),
      ),
      //home: const DetailPage(),
    );
  }
}
