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
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            tabs: _provider.sourcesList.map((e) => Text(e.name)).toList(),
            onTap: (tabIndex) {
              _provider.setSelectedIndex(tabIndex);
              _provider.getAllArticles();
            },
          ),
        ),
        Expanded(
          child: _provider.articlesList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  itemBuilder: (context, index) {
                    final article = _provider.articlesList[index].urlToImage;
                    return Container(
                      width: size.width * 0.9,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black12,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: article,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: _provider.articlesList.length,
                ),
        ),
      ],
    );
  }
}
