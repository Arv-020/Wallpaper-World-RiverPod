import 'dart:collection';
import 'dart:convert';
import 'dart:developer' as console show log;
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:wallpaper_world/models/wallpaper_model.dart';

class ApiController extends ChangeNotifier {
  List<Photo> _listPhotos = [];
  int totalResults = -1;
  UnmodifiableListView<Photo> get listPhotos =>
      UnmodifiableListView(_listPhotos);

    

  List<Photo> _bestOfTheMonth = [];
  UnmodifiableListView<Photo> get bestOfTheMonth =>
      UnmodifiableListView(_bestOfTheMonth);

  void resetList() {
    _listPhotos = [];
    totalResults = -1;
  }

  void clearBestList() {
    _bestOfTheMonth = [];
  }

  Future<void> fetchBestImages({required int page}) async {
    var response = await http.get(
        Uri.parse(
          "https://api.pexels.com/v1/curated?per_page=10&page=$page",
        ),
        headers: {
          "Authorization":
              "Y1PtwSug4ODUe0LtZgjGy8Q2oDhjaPXgNZdWU8ojq7qVgh82S073phA4"
        });
    if (response.statusCode == 200) {
      console.log(page.toString());
      var data = jsonDecode(response.body.toString());
      final wallpaperData = WallpaperModel.fromJson(data);

      for (final element in wallpaperData.photos!) {
        _bestOfTheMonth.add(element!);
      }

      notifyListeners();
    } else {
      console.log(response.statusCode.toString());
    }
  }

  Future<void> fetchImages({required String keyWord, required int page}) async {
    String keyword = keyWord;
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$keyword&per_page=15&page=$page"),
        headers: {
          "Authorization":
              "Y1PtwSug4ODUe0LtZgjGy8Q2oDhjaPXgNZdWU8ojq7qVgh82S073phA4"
        });

    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body.toString());
      console.log(data["page"].toString());

      final wallpaperData = WallpaperModel.fromJson(data);
      totalResults = wallpaperData.totalresults!;
      // for (final element in wallpaperData.photos!) {
      //   _listPhotos.addAll(element!);
      // }

      _listPhotos.addAll(wallpaperData.photos!.map((e) => e!));

      notifyListeners();

      
    } else {
      console.log(response.statusCode.toString());
    
    }
  }
}
