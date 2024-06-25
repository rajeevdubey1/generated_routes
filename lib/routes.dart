import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generated_routes/cubits/first_cubit.dart';
import 'package:generated_routes/cubits/second_cubit.dart';
import 'package:generated_routes/cubits/third_cubit.dart';
import 'package:generated_routes/pages/first_page.dart';
import 'package:generated_routes/pages/second_page.dart';
import 'package:generated_routes/pages/third_page.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){

      case '/first':
      return MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => FirstCubit(),
      child:const FirstPage(title: 'First Page'),),);

      case '/second':
      Map<String, dynamic> arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => SecondCubit(),
      child:SecondPage(title: arguments["title"]),),);

      case '/third':
      return MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => ThirdCubit(),
      child:const ThirdPage(title: 'Third Page'),),);

      default:
      return null;

    }
  }
}