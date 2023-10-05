import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wallpaper_world/screens/wallpaperscreen.dart';

class CustomStaggeredGridView extends StatelessWidget {
  const CustomStaggeredGridView({super.key, required this.img});
  final List<String> img;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
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
                  builder: (context) => WallpaperScreen(img: img[index]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                right: index % 2 == 0 ? 5 : 0,
                left: index % 2 == 1 ? 5 : 0,
                bottom: 10,
              ),
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
          );
        });
  }
}
