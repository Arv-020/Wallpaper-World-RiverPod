import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_world/screens/wallpaperscreen.dart';
import 'package:http/http.dart' as http;

class CustomStaggeredGridView extends StatelessWidget {
  const CustomStaggeredGridView(
      {super.key, required this.img, required this.title});
  final List<String> img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: img.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WallpaperScreen(
                    img: img[index],
                    tag: index.toString(),
                  ),
                ),
              );
            },
            child: Hero(
              tag: "$index",
              child: Container(
                height: index % 2 == 0
                    ? MediaQuery.sizeOf(context).width / 1.6
                    : MediaQuery.sizeOf(context).width / 1.5,
                width: MediaQuery.sizeOf(context).width * .39,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(img[index]),
                    )),
              ),
            ),
          );
        });
  }
}
