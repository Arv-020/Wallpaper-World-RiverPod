import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_world/components/title_widget.dart';
import 'package:wallpaper_world/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_world/screens/wallpaper_list_screen.dart';
// import 'package:wallpaper_world/models/pixelapimodel.dart';

import '../widgets/homescreen/bestofmonth_listview.dart';
import '../widgets/homescreen/category_gridview.dart';
import '../widgets/homescreen/color_listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchTxt = TextEditingController();
// for trending images
  fetchBestImages() async {
    var response = await http.get(
        Uri.parse(
          "https://api.pexels.com/v1/curated?per_page=10",
        ),
        headers: {
          "Authorization":
              "Y1PtwSug4ODUe0LtZgjGy8Q2oDhjaPXgNZdWU8ojq7qVgh82S073phA4"
        });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      List photos = data["photos"];

      photos.forEach((element) {
        Map<String, dynamic> src = element["src"];
        bestOfTheMonth.add(src["portrait"].toString());
      });
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBestImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 216, 235, 239),
                Color.fromARGB(255, 230, 238, 240),
                Color.fromARGB(255, 238, 241, 242),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * .20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * .06),
                  child: TextField(
                    controller: searchTxt,
                    keyboardType: TextInputType.text,
                    style: GoogleFonts.aBeeZee(color: Colors.grey.shade400),
                    decoration: InputDecoration(
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (searchTxt.text.toString().trim().isEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Blank Search Field"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Ok"))
                                        ],
                                      );
                                    });
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            WallpaperListScreen(
                                                title: searchTxt.text
                                                    .toString()
                                                    .trim())));
                              }
                            },
                            child: const Icon(
                              UniconsLine.search,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                      suffixIconColor: Colors.grey.shade300,
                      hintText: "Find Wallpaper..",
                      hintStyle:
                          GoogleFonts.aBeeZee(color: Colors.grey.shade400),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 16),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * .10,
                ),
                FutureBuilder(
                  future: fetchBestImages(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TitleAndWidget(
                        title: "Best of the month",
                        child: CustomPageView(
                            height: 225,
                            width: MediaQuery.sizeOf(context).width * .39,
                            bestofthemonthData: bestOfTheMonth),
                      );
                    } else {
                      return const Text("Error");
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * .10,
                ),
                TitleAndWidget(
                  title: "The color tone",
                  child: ColorToneListView(
                      height: 50, widht: 50, colorData: colorTone),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width * .10,
                ),
                const TitleAndWidget(
                    title: "Categories", child: CustomCategoryGridView())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
