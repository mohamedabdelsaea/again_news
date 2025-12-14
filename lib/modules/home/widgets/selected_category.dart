import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/model/time_publish.dart';
import 'package:again_news/modules/manager/cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SelectedCategory extends StatefulWidget {
  const SelectedCategory({super.key});

  @override
  State<SelectedCategory> createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  late HomeCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HomeCubit>();

    Future.wait([
      _cubit.getAllSources(),
    ]).then((value) {
      if (value[0]) {
        _cubit.getAllArticles();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);

    return BlocConsumer<HomeCubit,HomeStats>(
      listener: (context, state) {},
      builder: (context,state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skeletonizer(
              enabled: state is LoadingGetAllSourcesStat,
              child: DefaultTabController(
                length: _cubit.sourcesList.length,
                child: TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorPadding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  tabs: _cubit.sourcesList.map((e) => Text(e.name)).toList(),
                  onTap: (tabIndex) {
                    _cubit.setSelectedIndex(tabIndex);
                    _cubit.getAllArticles();
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemBuilder: (context, index) {
                  final article =_cubit.articlesList[index].urlToImage;
                  return Skeletonizer(
                    enabled: state is LoadingGetAllArticlesStat,
                    child: Container(
                      width: size.width * 0.9,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black12,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: article,
                        imageBuilder: (context, imageProvider) => Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _cubit.articlesList[index].title,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _cubit.articlesList[index].author,
                                      style: theme.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    TimePublish.format(
                                        _cubit.articlesList[index].publishedAt),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        placeholder: (context, url) => SizedBox(),
                        errorWidget: (context, url, error) => Icon(
                          Icons.error,
                          size: 60,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: _cubit.articlesList.length,
              ),
            ),
          ],
        );
      }
    );
  }
}
