import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/modules/home/widgets/drawer_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      drawer: DrawerHome(),
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
            color: AppColor.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Icon(
            Icons.search_outlined,
            color: AppColor.black,
            size: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' Good Morning \n Here is Some News For You',
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: AssetImage('assets/images/buisness_img.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: size.width* 0.8,
                     height: size.height *0.3,
                  );
                },
                itemCount: 7,
                separatorBuilder: (context, index) => SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
