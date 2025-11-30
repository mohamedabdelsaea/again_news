import 'package:again_news/core/route/app_routes.dart';
import 'package:again_news/core/route/page_route_name.dart';
import 'package:again_news/modules/manager/provider_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ProviderSetting(),
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
      initialRoute: PageRouteName.home,
      navigatorKey: navigatorKey,
    );
  }
}
