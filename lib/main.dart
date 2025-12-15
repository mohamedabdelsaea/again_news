import 'package:again_news/core/route/app_routes.dart';
import 'package:again_news/core/route/page_route_name.dart';
import 'package:again_news/modules/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(BlocProvider<HomeCubit>(
    create: (context) => HomeCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: PageRouteName.initial,
      navigatorKey: navigatorKey,
    );
  }
}
