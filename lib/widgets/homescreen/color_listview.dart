import 'package:flutter/material.dart';

class ColorToneListView extends StatelessWidget {
  const ColorToneListView(
      {super.key, this.height, this.widht, required this.colorData});
  final double? height, widht;
  final List<Color> colorData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colorData.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                    color: colorData[index],
                    borderRadius: BorderRadius.circular(10)),
                height: height,
                width: widht,
                margin: EdgeInsets.only(
                    left: (index == 0)
                        ? (MediaQuery.sizeOf(context).width * .06)
                        : MediaQuery.sizeOf(context).width * .042,
                    right: (index == colorData.length - 1)
                        ? (MediaQuery.sizeOf(context).width * .06)
                        : 0));
          }),
    );
  }
}
