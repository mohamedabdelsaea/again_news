import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/model/category_model.dart';
import 'package:again_news/modules/home/widgets/drawer_home.dart';
import 'package:again_news/modules/home/widgets/home_category.dart';
import 'package:again_news/modules/home/widgets/selected_category.dart';
import 'package:again_news/modules/manager/provider_setting.dart';
import 'package:again_news/network/api_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderSetting>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ApiNetwork.getAllSources("general");
        },
      ),
      backgroundColor: AppColor.white,
      drawer: DrawerHome(),
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          provider.selectedCategory == null
              ? 'Home'
              : provider.selectedCategory!.categoryID,
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
      body: provider.selectedCategory == null
          ? HomeCategory(
              categoryList: provider.categoryList,
              onCategoryClicked: provider.onCategoryClicked,
            )
          : SelectedCategory(
            ),
    );
  }
}
