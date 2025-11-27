import 'package:again_news/modules/manager/provider_setting.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedCategory extends StatefulWidget {
  const SelectedCategory({super.key});

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  late ProviderSetting _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<ProviderSetting>(context, listen: false);

    Future.wait([
      _provider.getAllSources(),
    ]).then((value) {
      if (value[0]) {
        _provider.getAllArticles();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<ProviderSetting>(
      builder: (context, value, child) {
        // -------------------------
        // حماية من البيانات الفاضية
        // -------------------------
        if (value.sourcesList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTabController(
              length: value.sourcesList.length,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                tabs: value.sourcesList
                    .map((e) => Text(e.name))
                    .toList(),

                // -------------------------
                // إصلاح تغيير المصدر
                // -------------------------
                onTap: (tabIndex) {
                  value.setSelectedIndex(tabIndex);
                  value.getAllArticles(); // مهم جداً
                },
              ),
            ),

            // -------------------------
            // عرض المقالات
            // -------------------------
            Expanded(
              child: value.articlesList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                itemBuilder: (context, index) {
                  final article = value.articlesList[index];
                  final image = article.urlToImage ?? "";

                  return Container(
                    width: size.width * 0.9,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black12,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,

                        // لو الصورة اشتغلت
                        imageBuilder: (context, imageProvider) =>
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                        // تحميل
                        placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),

                        // خطأ في الصورة
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 10),
                itemCount: value.articlesList.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
