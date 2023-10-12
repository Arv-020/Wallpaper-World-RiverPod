import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_world/constants/constants.dart';
import 'package:wallpaper_world/screens/wallpaper_list_screen.dart';

class CustomCategoryGridView extends StatelessWidget {
  const CustomCategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: MediaQuery.sizeOf(context).height / 2.5,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 21 / 10,
            mainAxisSpacing: 16,
          ),
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
              child: Container(
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
                    image: NetworkImage(categoryList[index].img[0]),
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
              ),
            );
          }),
    );
  }
}
