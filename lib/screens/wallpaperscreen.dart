import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_world/widgets/wallpaperscreen/cutombutton.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(img),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    title: "Info",
                    icon: UniconsLine.info,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .10,
                  ),
                  CustomButton(
                    title: "Save",
                    icon: UniconsLine.image_download,
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .10,
                  ),
                  CustomButton(
                    title: "Apply",
                    icon: Icons.brush,
                    color: Colors.blue.withOpacity(0.9),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width * .10,
              )
            ]),
      )),
    );
  }
}
