import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_world/components/title_widget.dart';
import 'package:wallpaper_world/constants/constants.dart';

import '../widgets/homescreen/bestofmonth_listview.dart';
import '../widgets/homescreen/category_gridview.dart';
import '../widgets/homescreen/color_listview.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final searchTxt = TextEditingController();

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
                      suffixIcon: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          Icon(
                            UniconsLine.search,
                            size: 28,
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
                TitleAndWidget(
                  title: "Best of the month",
                  child: CustomPageView(
                    height: 225,
                    width: MediaQuery.sizeOf(context).width * .39,
                    bestofthemonthData: bestOfTheMonth,
                  ),
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
