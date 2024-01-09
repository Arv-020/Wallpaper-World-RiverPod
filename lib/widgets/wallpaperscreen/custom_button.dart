import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.icon,
      required this.color,
      required this.title,
      this.onPressed});
  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              fixedSize: const Size(65, 65),
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Icon(
            
            icon,
            size: 20,
            color: Colors.white,
            // size: 30,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).width * .03,
        ),
        Text(
          title,
          style: GoogleFonts.aBeeZee(
            fontSize: 17,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
