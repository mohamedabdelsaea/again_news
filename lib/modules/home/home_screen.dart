import 'package:again_news/core/route/page_route_name.dart';
import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/main.dart';
import 'package:again_news/model/category_model.dart';
import 'package:again_news/modules/home/widgets/drawer_home.dart';
import 'package:again_news/modules/home/widgets/home_category.dart';
import 'package:again_news/modules/home/widgets/selected_category.dart';
import 'package:again_news/modules/manager/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStats>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            backgroundColor: AppColor.white,
            drawer: DrawerHome(),
            appBar: AppBar(
              backgroundColor: AppColor.white,
              centerTitle: true,
              title: Text(
                cubit.selectedCategory == null
                    ? 'Home'
                    : cubit.selectedCategory!.categoryID,
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    navigatorKey.currentState!.pushNamedAndRemoveUntil(
                      PageRouteName.sibha,
                      (route) => false,
                    );
                  },
                  child: Icon(
                    Icons.search_outlined,
                    color: AppColor.black,
                    size: 30,
                  ),
                )
              ],
            ),
            body: cubit.selectedCategory == null
                ? HomeCategory(
                    categoryList: cubit.categoryList,
                    onCategoryClicked: cubit.onCategoryClicked,
                  )
                : SelectedCategory(),
          );
        });
  }
}
