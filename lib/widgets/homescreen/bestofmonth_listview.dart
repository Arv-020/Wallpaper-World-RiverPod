import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wallpaper_world/constants/constants.dart';
import 'package:wallpaper_world/models/pixelapimodel.dart';
import 'package:wallpaper_world/screens/wallpaperscreen.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView(
      {super.key,
      required this.height,
      required this.width,
      required this.bestofthemonthData});
  final double? height, width;
  final List<dynamic> bestofthemonthData;

  @override
  Widget build(BuildContext context) {
    print(bestofthemonthData);
    return SizedBox(
      height: height,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bestofthemonthData.length,
          itemBuilder: (context, index) {
            String tag = Uuid().v4();
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WallpaperScreen(
                      img: bestOfTheMonth[index],
                      tag: tag,
                    ),
                  ),
                );
              },
              child: Hero(
                transitionOnUserGestures: true,
                tag: tag,
                child: Container(
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
                          image: NetworkImage(
                            bestofthemonthData[index],
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(
                        left: (index == 0)
                            ? (MediaQuery.sizeOf(context).width * .06)
                            : MediaQuery.sizeOf(context).width * .043,
                        right: (index == bestofthemonthData.length - 1)
                            ? (MediaQuery.sizeOf(context).width * .06)
                            : 0)),
              ),
            );
          }),
    );
  }
}
