import 'dart:convert';
import 'dart:developer';
import 'package:again_news/core/constants/constants.dart';
import 'package:again_news/core/constants/end_points.dart';
import 'package:again_news/model/article_model.dart';
import 'package:again_news/model/source_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiNetwork {
  static Future<List<Source>> getAllSources(String categoryID) async {
    try {
      var queryParameters = {
        "apiKey": Constants.apiKey,
        "category": categoryID,
      };
      var uir = Uri.https(
        Constants.baseUrL,
        EndPoints.getAllSources,
        queryParameters,
      );
      var response = await http.get(uir);

      // log(response.body);
      // log(response.toString());
      Map<String, dynamic> data = jsonDecode(response.body);

      SourcesModel sourcesModel = SourcesModel.fromJson(data);

      return sourcesModel.source;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  static Future<List<Article>> getAllArticles(String sourcesID) async {
    try {
      var queryParameters = {
        "apiKey": Constants.apiKey,
        "sources": sourcesID,
      };
      var uir = Uri.https(
        Constants.baseUrL,
        EndPoints.getAllArticles,
        queryParameters,
      );
      var response = await http.get(uir);

      log(response.body);
      log(response.toString());
      Map<String, dynamic> data = jsonDecode(response.body);

      ArticleModel articleModel = ArticleModel.fromJson(data);

      log(data.toString());

      return articleModel.articles;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
