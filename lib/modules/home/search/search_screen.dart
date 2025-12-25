import 'dart:developer';
import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/main.dart';
import 'package:again_news/model/article_model.dart';
import 'package:again_news/network/api_network.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Article> article = [];

  int currentPage = 1;
  bool isLoading = false;

  String? errorMessage = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const SizedBox(),
            leadingWidth: 0,
            toolbarHeight: 80,
            floating: true,
            title: TextFormField(
              controller: controller,
              onFieldSubmitted: (value) {
                article.clear();
                currentPage = 1;
                _search();
              },
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
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColor.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColor.black),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 40),
          ),

          if (isLoading)
            const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

          if (!isLoading && article.isEmpty)
            SliverToBoxAdapter(
              child: Lottie.asset('assets/animation/empty.json'),
            ),

          if (article.isNotEmpty)
            SliverList.separated(
              itemBuilder: (context, index) {
                final item = article[index];
                return ListTile(
                  title: Text(
                    item.title ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    item.description ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemCount: article.length,
            ),
        ],
      ),
    );
  }

  Future<void> _search() async {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      final List<Article> response = await ApiNetwork.search(
        search: controller.text,
        pageNumber: currentPage,
      );

      article.addAll(response);
      currentPage++;
    } catch (e) {
      errorMessage = e.toString();
      log('Search error: $errorMessage');
    } finally {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }
}
