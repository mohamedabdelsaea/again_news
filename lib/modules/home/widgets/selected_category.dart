import 'package:again_news/model/category_model.dart';
import 'package:again_news/modules/manager/provider_setting.dart';
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
      (value) {},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderSetting>(
      builder: (context, _provider, child) {
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
              ),
            ),
          ],
        );
      },
    );
  }
}
