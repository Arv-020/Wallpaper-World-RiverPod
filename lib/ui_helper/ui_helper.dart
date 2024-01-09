import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UiHelper {
  static void showSnackBar(BuildContext context, {required String title}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(title),
    ));
  }


static Widget noNetworkWidget() {
    return Center(
      child: Lottie.asset("assets/animation/no-network-animation.json"),
    );
  }
}
