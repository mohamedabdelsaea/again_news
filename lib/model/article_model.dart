class ArticleModel {
  final String status;
  final List<Article> articles;

  ArticleModel({
    required this.status,
    required this.articles,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      status: json['status'],
      articles: (json['articles'] as List)
          .map(
            (e) => Article.fromJson(e),
          )
          .toList(),
    );
  }
}

class Article {
  final String id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['source']['id'],
      author: json['source']['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
