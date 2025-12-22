import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/main.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

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
        ],
      ),
    );
  }
}
