import 'package:again_news/core/route/page_route_name.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_color.dart';
import '../../../model/category_model.dart';

class HomeCategory extends StatelessWidget {
  final void Function(CategoryModel) onCategoryClicked;

  const HomeCategory({
    super.key,
    required this.onCategoryClicked,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<CategoryModel> categoryList = [
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ' Good Morning \n Here is Some News For You',
              style: theme.textTheme.headlineSmall,
            ),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Stack(
                  alignment: index % 2 == 0
                      ? Alignment.bottomRight
                      : Alignment.bottomLeft,
                  children: [
                    Image.asset(categoryList[index].categoryImg),
                    GestureDetector(
                      onTap: () {
                        onCategoryClicked (categoryList[index]);
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                        height: 55,
                        width: 175,
                        decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Directionality(
                          textDirection: index % 2 == 0
                              ? TextDirection.ltr
                              : TextDirection.rtl,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'View All ',
                                style: theme.textTheme.headlineSmall,
                              ),
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: categoryList.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
            ),
          ],
        ),
      ),
    );
  }
}
