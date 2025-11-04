import 'dart:developer';
import 'package:flutter/material.dart';
import '../../model/category_model.dart';

class ProviderSetting extends ChangeNotifier {

  List<CategoryModel> _categoryList = [
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

  CategoryModel? get selectedCategory => _selectedCategory;

  List<CategoryModel> get categoryList => _categoryList;

  void onCategoryClicked(CategoryModel selectedCategory) {
    _selectedCategory = selectedCategory;
    log(selectedCategory.categoryID);
    notifyListeners();
  }

  void getHome (){
    _selectedCategory = null ;
    notifyListeners();
  }
}
