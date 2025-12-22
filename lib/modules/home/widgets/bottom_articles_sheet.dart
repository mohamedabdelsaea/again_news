import 'package:again_news/core/theme/app_color.dart';
import 'package:again_news/model/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomArticlesSheet {
  static void show(BuildContext context, Article article) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: article.urlToImage,
                imageBuilder: (context, imageProvider) => Container(
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(height: 12),
              Text(
                article.description,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColor.black,
                    foregroundColor: AppColor.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(8)),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    launchUrl(
                      Uri.parse(article.url ?? 'error'),
                      mode: LaunchMode.inAppBrowserView,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Full Articles'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}
