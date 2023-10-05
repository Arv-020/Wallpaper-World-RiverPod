import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper_world/widgets/wallpaperlist_screen/staggerdgridview.dart';

class WallpaperListScreen extends StatelessWidget {
  const WallpaperListScreen(
      {super.key, required this.img, required this.title});
  final List<String> img;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 216, 235, 239),
            Color.fromARGB(255, 230, 238, 240),
            Color.fromARGB(255, 238, 241, 242),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.sizeOf(context).width * .06,
              MediaQuery.sizeOf(context).width * .20,
              MediaQuery.sizeOf(context).width * .06,
              0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.aBeeZee(
                    fontSize: 48, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width * .03,
              ),
              Text(
                "${img.length} wallpaper available",
                style: GoogleFonts.aBeeZee(
                    color: Colors.grey.shade700, fontSize: 18),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).width * .03,
              ),
              Expanded(child: CustomStaggeredGridView(img: img)),
            ],
          ),
        ),
      ),
    ));
  }
}
