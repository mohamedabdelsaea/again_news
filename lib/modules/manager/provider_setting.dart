import 'dart:developer';
import 'package:again_news/model/article_model.dart';
import 'package:again_news/model/source_model.dart';
import 'package:again_news/network/api_network.dart';
import 'package:flutter/material.dart';
import '../../model/category_model.dart';

class ProviderSetting extends ChangeNotifier {
  final List<CategoryModel> _categoryList = [
    CategoryModel(
      categoryID: 'general',
      categoryName: 'general',
      categoryImg: 'assets/images/general_img.png',
    ),
    CategoryModel(
      categoryID: 'business',
      categoryName: 'business',
      categoryImg: 'assets/images/business_img.png',
    ),
    CategoryModel(
      categoryID: 'sports',
      categoryName: 'sports',
      categoryImg: 'assets/images/sports_img.png',
    ),
    CategoryModel(
      categoryID: 'technology',
      categoryName: 'technology',
      categoryImg: 'assets/images/technology_img.png',
    ),
    CategoryModel(
      categoryID: 'entertainment',
      categoryName: 'entertainment',
      categoryImg: 'assets/images/entertainment_img.png',
    ),
    CategoryModel(
      categoryID: 'health',
      categoryName: 'health',
      categoryImg: 'assets/images/health_img.png',
    ),
    CategoryModel(
      categoryID: 'science',
      categoryName: 'science',
      categoryImg: 'assets/images/science_img.png',
    ),
  ];

  CategoryModel? _selectedCategory;
  int _selectedTapIndex = 0;
  List<Source> _sourcesList = [];
  List<Article> _articlesList = [];

  CategoryModel? get selectedCategory => _selectedCategory;

  List<Source> get sourcesList => _sourcesList;

  List<CategoryModel> get categoryList => _categoryList;

  List<Article> get articlesList => _articlesList;

  void setSelectedIndex(int index) {
    _selectedTapIndex = index;
    notifyListeners();
  }

  void onCategoryClicked(CategoryModel selectedCategory) {
    _selectedCategory = selectedCategory;
    log(selectedCategory.categoryID);
    notifyListeners();
  }

  void getHome() {
    _selectedCategory = null;
    notifyListeners();
  }

  Future<bool> getAllSources() async {
    try {
      _sourcesList = await ApiNetwork.getAllSources(
        _selectedCategory!.categoryID,
      );
      log(_sourcesList.toString());
      log(_selectedCategory!.categoryID);
      notifyListeners();
      return Future.value(true);
    } catch (error) {
      return Future.value(false);
    }
  }

  Future<void> getAllArticles() async {
    _articlesList =
        await ApiNetwork.getAllArticles(_sourcesList[_selectedTapIndex].id);
    log('عدد المقالات: ${_articlesList.length}');
    log(_articlesList.toString());
    notifyListeners();
  }
}
