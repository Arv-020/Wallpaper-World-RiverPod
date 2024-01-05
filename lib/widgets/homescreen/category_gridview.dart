import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_world/constants/constants.dart';
import 'package:wallpaper_world/screens/wallpaper_list_screen.dart';

class CustomCategoryGridView extends StatelessWidget {
  const CustomCategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 21 / 10,
            mainAxisSpacing: 16,
          ),
          shrinkWrap: true,
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WallpaperListScreen(
                      title: categoryList[index].category,
                    ),
                  ),
                );
              },
                child: CachedNetworkImage(
                  imageUrl: categoryList[index].img[0],
                  placeholder: (context, url) {
                    return Shimmer(
                      gradient: LinearGradient(colors: [
                        Colors.grey,
                        Colors.grey.shade100,
                        Colors.grey.shade900,
                      ]),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: index % 2 == 0
                                ? (MediaQuery.sizeOf(context).width * .058)
                                : 8,
                            right: index % 2 == 1
                                ? (MediaQuery.sizeOf(context).width * .058)
                                : 8),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            categoryList[index].category,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: index % 2 == 0
                              ? (MediaQuery.sizeOf(context).width * .058)
                              : 8,
                          right: index % 2 == 1
                              ? (MediaQuery.sizeOf(context).width * .058)
                              : 8),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: imageProvider,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          categoryList[index].category,
                          style: GoogleFonts.aBeeZee(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                )
            );
          }),
    );
  }
}
