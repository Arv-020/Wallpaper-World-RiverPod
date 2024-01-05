

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_world/models/wallpaper_model.dart';
import 'package:wallpaper_world/screens/wallpaperscreen.dart';


class CustomStaggeredGridView extends StatelessWidget {
  const CustomStaggeredGridView(
      {super.key,
      required this.img,
      required this.title,
      required this.scrollController,
      required this.totalResults});
  final List<Photo?> img;
  final String title;
  final ScrollController scrollController;
  final int totalResults;
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        controller: scrollController,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          
        ),
        
        itemCount: img.length + 1,
        itemBuilder: (context, index) {
         


          if (index < img.length) {
          final image = img[index]!.src!.portrait!;

            return CachedNetworkImage(
              imageUrl: image,
              placeholder: (context, url) {
                return Shimmer(
                  direction: ShimmerDirection.ltr,
                  gradient: LinearGradient(colors: [
                    Colors.grey,
                    Colors.grey.shade100,
                    Colors.grey.shade900,
                  ]),
                  child: Container(
                    height: index % 2 == 0 ? 290 : 300,
                    width: MediaQuery.sizeOf(context).width * .39,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                  ),
                );
              },
              imageBuilder: (context, imageProvider) {
                return GestureDetector(
                  onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WallpaperScreen(
                    img: image,
                    tag: index.toString(),
                  ),
                ),
              );
            },
                  child: Hero(
                    tag: "$index",
                    child: Container(
                      height: index % 2 == 0 ? 290 : 300,
                      width: MediaQuery.sizeOf(context).width * .39,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider,
                          )),
                    ),
                  ),
                );
              },
            );
          } else {
            if (totalResults != img.length) {
              return Shimmer(
                direction: ShimmerDirection.ltr,
                gradient: LinearGradient(colors: [
                  Colors.grey,
                  Colors.grey.shade100,
                  Colors.grey.shade900,
                ]),
                child: Container(
                  alignment: Alignment.center,
                  height: 300,
                  width: MediaQuery.sizeOf(context).width * .39,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text("Loading.."),
                ),
              );
            } else {
              return const SizedBox();
            }
          }
        });
  }
}
