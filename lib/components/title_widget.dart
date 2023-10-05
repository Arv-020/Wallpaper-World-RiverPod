import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleAndWidget extends StatelessWidget {
  const TitleAndWidget({super.key, required this.title, required this.child});
  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * .06),
          child: Text(
            title,
            style:
                GoogleFonts.aBeeZee(fontSize: 22, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).width * .05,
        ),
        child
      ],
    );
  }
}
