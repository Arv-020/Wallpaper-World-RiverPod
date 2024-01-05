import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:uuid/uuid.dart';
import 'package:wallpaper_world/constants/constants.dart';
import 'package:wallpaper_world/models/wallpaper_model.dart';

import 'package:wallpaper_world/screens/wallpaperscreen.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView(
      {super.key,
      required this.height,
      required this.width,
      required this.bestofthemonthData,
      required this.controller});
  final double? height, width;
  final List<Photo> bestofthemonthData;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    print(bestofthemonthData);
    return SizedBox(
      height: height,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: bestofthemonthData.length,
          itemBuilder: (context, index) {
            String tag = const Uuid().v4();
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WallpaperScreen(
                      img: bestofthemonthData[index].src!.portrait!,
                      tag: tag,
                    ),
                  ),
                );
              },
              child: Hero(
                transitionOnUserGestures: true,
                tag: tag,
                child: CachedNetworkImage(
                  imageUrl: bestofthemonthData[index].src!.portrait!,
                  placeholder: (context, url) {
                    return Shimmer(
                        gradient: LinearGradient(colors: [
                          Colors.grey,
                          Colors.grey.shade100,
                          Colors.grey.shade900
                        ]),
                        child: Container(
                            height: height,
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            margin: EdgeInsets.only(
                                left: (index == 0)
                                    ? (MediaQuery.sizeOf(context).width * .06)
                                    : MediaQuery.sizeOf(context).width * .043,
                                right: (index == bestofthemonthData.length - 1)
                                    ? (MediaQuery.sizeOf(context).width * .06)
                                    : 0)));
                  },
                  imageBuilder: (context, imageProvider) {
                    return Container(
                        height: height,
                        width: width,
                        decoration: BoxDecoration(
                          // boxShadow: const [
                          //   BoxShadow(
                          //     blurRadius: 0.5,
                          //     spreadRadius: 0,
                          //     offset: Offset(2, 0),
                          //   )
                          // ],
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: EdgeInsets.only(
                            left: (index == 0)
                                ? (MediaQuery.sizeOf(context).width * .06)
                                : MediaQuery.sizeOf(context).width * .043,
                            right: (index == bestofthemonthData.length - 1)
                                ? (MediaQuery.sizeOf(context).width * .06)
                                : 0));
                  },
                ),
              ),
            );
          }),
    );
  }
}
