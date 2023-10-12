import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_world/widgets/wallpaperlist_screen/staggerdgridview.dart';

class WallpaperListScreen extends StatefulWidget {
  const WallpaperListScreen({super.key, required this.title});

  final String title;

  @override
  State<WallpaperListScreen> createState() => _WallpaperListScreenState();
}

class _WallpaperListScreenState extends State<WallpaperListScreen> {
  final List<String> img = [];
  Future<bool> fetchImages() async {
    String keyword = widget.title.toLowerCase();
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$keyword&per_page=200"),
        headers: {
          "Authorization":
              "Y1PtwSug4ODUe0LtZgjGy8Q2oDhjaPXgNZdWU8ojq7qVgh82S073phA4"
        });

    if (response.statusCode == 200) {
      print(response.body);
      print("yes");
      var data = jsonDecode(response.body.toString());
      List photos = data["photos"];
      for (var element in photos) {
        img.add(element["src"]["portrait"]);
      }
      return true;
    } else {
      print("no");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
          future: fetchImages(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
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
                        widget.title,
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
                      Expanded(
                          child: CustomStaggeredGridView(
                        img: img,
                        title: widget.title,
                      ))
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: RefreshProgressIndicator(),
              );
            }
          }),
    ));
  }
}
