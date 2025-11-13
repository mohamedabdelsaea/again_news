import 'package:again_news/model/category_model.dart';
import 'package:again_news/modules/manager/provider_setting.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectedCategory extends StatefulWidget {
  final CategoryModel categoryModel;

  const SelectedCategory({
    super.key,
    required this.categoryModel,
  });

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  late ProviderSetting _provider;

  @override
  void initState() {
    _provider = Provider.of<ProviderSetting>(context, listen: false);
    Future.wait([
      _provider.getAllSources(),
    ]).then(
      (value) {
        if (value[0]) {
          _provider.getAllArticles();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<ProviderSetting>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTabController(
              length: _provider.sourcesList.length,
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                tabs: _provider.sourcesList
                    .map(
                      (e) => Text(e.name),
                    )
                    .toList(),
                onTap: _provider.setSelectedIndex,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  itemBuilder: (context, index) {
                    return Container(
                      width: size.width * 0.9,
                      height: size.height * 0.3,
                      child: CachedNetworkImage(
                        imageUrl: _provider.articlesList[index].urlToImage,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.red, BlendMode.colorBurn)),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemCount: _provider.articlesList.length),
            ),
          ],
        );
      },
    );
  }
}
