import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/main.dart';
import 'package:again_news/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Article> article = [];
  int maxPage = 0;

  int currentPage = 0;
  String? errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: SizedBox(),
            leadingWidth: 0,
            toolbarHeight: 80,
            floating: true,
            title: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColor.black,
                  size: 30,
                ),
                suffixIcon: InkWell(
                    onTap: () {
                      navigatorKey.currentState!.pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: 25,
                      color: AppColor.black,
                    )),
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: AppColor.black,
                  fontWeight: FontWeight.w600,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColor.black,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColor.black,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColor.black,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
          if (article.isEmpty)
            SliverToBoxAdapter(
                child: Lottie.asset('assets/animation/empty.json')),
          if (article.isNotEmpty)
            SliverList.separated(
              itemBuilder: (context, index) {
                return ;
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 5);
              },
              itemCount: article.length,
            )
        ],
      ),
    );
  }
}
