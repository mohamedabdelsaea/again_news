import 'package:again_news/core/route/page_route_name.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      surfaceTintColor: AppColor.black,
      width: size.width * 0.7,
      backgroundColor: AppColor.black,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.3,
            color: AppColor.white,
            child: Center(
              child: Text(
                'News App',
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRouteName.home);
            },
            child: Row(
              children: [
                SizedBox(width: 15),
                Icon(Icons.home, color: AppColor.white),
                SizedBox(width: 10),
                Text(
                  'Go To Home',
                  style: TextStyle(
                    color: AppColor.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Divider(
            color: AppColor.white,
            thickness: 2,
            endIndent: 20,
            indent: 20,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              SizedBox(width: 15),
              Icon(Icons.brush, color: AppColor.white),
              SizedBox(width: 10),
              Text(
                'Theme',
                style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Divider(
            color: AppColor.white,
            thickness: 2,
            endIndent: 20,
            indent: 20,
          ),
          SizedBox(height: 15),
          Row(
            children: [
              SizedBox(width: 15),
              Icon(Icons.language, color: AppColor.white),
              SizedBox(width: 10),
              Text(
                'Language',
                style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
