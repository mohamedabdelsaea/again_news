import 'dart:async';

import 'package:again_news/core/route/page_route_name.dart';
import 'package:again_news/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          PageRouteName.home,
          (route) => false,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(
          'assets/images/news_logo.png',
          width: size.width * 0.9,
          height: size.height * 0.7,
        ),
      ),
    );
  }
}
