import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:movie_trailer/models/movie_models.dart';
import 'package:http/http.dart' as http;

class MovieProvider with ChangeNotifier {
  final apiPath =
      'https://api.themoviedb.org/3/movie/popular?api_key=6e11619c21e5e8c8b64740255a66bac5';

  var VIDEO_PATH =
      'http://api.themoviedb.org/3/movie/550/videos?api_key=6e11619c21e5e8c8b64740255a66bac5';

  List<MovieModel> _item = [];

  List<MovieModel> get item => _item;

  add(MovieModel model) {
    // ignore: unnecessary_null_comparison
    if (_item.contains(model)) {
      update(_item.indexWhere((element) => element.id == model.id), model);
    } else {
      _item.add(model);
      notifyListeners();
    }
  }

  update(int index, MovieModel model) {
    _item[index] = model;
    notifyListeners();
  }

  Future<void> fetch() async {
    final response = await http.get(Uri.parse(apiPath), headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    });

    if (response.statusCode == 200) {
      for (var element in List.from(jsonDecode(response.body)['results'])) {
        add(MovieModel.fromJson(element));
      }
    } else {
      print('error status code ${response.statusCode} ${response.body}');
    }
  }

  Future<String> fetchPathImage(int imageId) async {
    final path =
        'https://api.themoviedb.org/3/movie/$imageId/images?api_key=6e11619c21e5e8c8b64740255a66bac5';

    final pathResponse = await http.get(Uri.parse(path));

    if (pathResponse.statusCode == 200) {
      final resultImage =
          'https://image.tmdb.org/t/p/w500/${jsonDecode(pathResponse.body)['posters'][0]['file_path']}?api_key=6e11619c21e5e8c8b64740255a66bac5';

      return resultImage;
    } else {
      return '';
    }
  }
}
