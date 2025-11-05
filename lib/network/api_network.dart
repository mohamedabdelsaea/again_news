import 'dart:developer';

import 'package:again_news/core/constants/constants.dart';
import 'package:again_news/core/constants/end_points.dart';
import 'package:http/http.dart' as http;

abstract class ApiNetwork {
  static getAllSources(String categoryID) async {
    try {
      var queryParameters = {
        "apiKey": Constants.apiKey,
        "category": categoryID,
      };
      var uir = Uri.https(
        Constants.baseUrl,
        EndPoints.getAllSources,
        queryParameters,
      );
      var data = await http.get(uir);
      log(data.body);
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
