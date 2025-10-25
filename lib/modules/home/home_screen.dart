import 'dart:developer';
import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/model/category_model.dart';
import 'package:again_news/modules/home/widgets/drawer_home.dart';
import 'package:again_news/modules/home/widgets/home_category.dart';
import 'package:again_news/modules/home/widgets/selected_category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? _selectedCategory;


  @override
  Widget build(BuildContext context) {
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
      body: _selectedCategory == null
          ? HomeCategory(
        onCategoryClicked: onCategoryClicked,
      )
          : SelectedCategory(),
    );
  }
  void onCategoryClicked(CategoryModel selectedCategory){
    _selectedCategory = selectedCategory ;
    log(selectedCategory.categoryID);
  }
}
