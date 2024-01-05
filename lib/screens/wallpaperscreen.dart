import 'dart:async';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:gallery_saver/files.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:unicons/unicons.dart';
import 'package:wallpaper_world/ui_helper/ui_helper.dart';
import 'package:wallpaper_world/widgets/wallpaperscreen/cutombutton.dart';

class WallpaperScreen extends StatelessWidget {
  const WallpaperScreen({super.key, required this.img, required this.tag});
  final String img;
  final String tag;

  Future<void> setHomeScreenWallpaper(BuildContext context) async {
    try {
      var location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(img);
      final result =
          await WallpaperManager.setWallpaperFromFile(file.path, location)
              .then((value) {
        if (value) {
          UiHelper.showSnackBar(context, title: "Wallpaper Set Successfully");
        } else {
          UiHelper.showSnackBar(context, title: "Something went wrong!");
        }
      });
      print(result);
    } catch (e) {
      UiHelper.showSnackBar(
        context,
        title: e.toString(),
      );
    }
  }

  Future<void> setLockScreenWallpaper(BuildContext context) async {
    try {
      var location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(img);
      final result =
          await WallpaperManager.setWallpaperFromFile(file.path, location)
              .then((value) {
        if (value) {
          UiHelper.showSnackBar(context, title: "Wallpaper Set Successfully");
        } else {
          UiHelper.showSnackBar(context, title: "Something went wrong!");
        }
      });
      print(result);
    } on PlatformException catch (e) {
      print(e);
    }
  }
 

  
  @override
  Widget build(BuildContext context) {
    var mH = MediaQuery.sizeOf(context).height;
    var mW = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Hero(
        tag: tag,
        child: Stack(
            alignment: Alignment.bottomCenter,
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CachedNetworkImage(
                imageUrl: img,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: mH,
                    width: mW,
                    decoration: BoxDecoration(
                      
                      image: DecorationImage(
                          fit: BoxFit.cover,
                        image: imageProvider),
                    ),
                  );
                },
              ),

              Positioned(
                // alignment: Alignment.bottomCenter,
                bottom: mH * .08,
                child: Row(
                  
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () async {
                        var response = await http.get(Uri.parse(img));
                        final imageBytes = response.bodyBytes;
                        final t = await getTemporaryDirectory();
                        final path = "${t.path}/WallpaperWorld.jpg";
                        File(path).writeAsBytesSync(imageBytes);

                        await Share.shareFiles([path]);
                      },
                      title: "Share",
                      icon: UniconsLine.share,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .10,
                    ),
                    CustomButton(
                      onPressed: () async {
                        GallerySaver.saveImage(img).then((value) {
                          if (value!) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    backgroundColor: Colors.transparent,
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        height: 300,
                                        width: 300,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Lottie.network(
                                                  "https://lottie.host/411501ad-620a-4c26-aa69-a51bc58cf0cc/QbvWJsLR5n.json",
                                                  height: 100,
                                                  width: 100),
                                              const SizedBox(
                                                height: 11,
                                              ),
                                              const Text(
                                                "Image Saved!",
                                                style: TextStyle(
                                                    fontSize: 35,
                                                    color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                });
                            Timer(const Duration(seconds: 3), () {
                              Navigator.pop(context);
                            });
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Dialog(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Center(
                                        child: Text(
                                          "Error",
                                          style: TextStyle(color: Colors.red),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  );
                                });
                            Timer(const Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          }
                        });
                      },
                      title: "Save",
                      icon: UniconsLine.image_download,
                      color: Colors.grey.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * .10,
                    ),
                    CustomButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SimpleDialog(
                                alignment: Alignment.center,
                                title: const Text(
                                  "Set as wallpaper",
                                  textAlign: TextAlign.center,
                                ),
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      
                                      setHomeScreenWallpaper(context).then(
                                          (value) => Navigator.pop(context));
                                    },
                                    child: const Text(
                                      "Home Screen",
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                     
                                      setLockScreenWallpaper(context).then(
                                          (value) => Navigator.pop(context));
                                    },
                                    child: const Text("Lock Screen"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      
                                      setHomeScreenWallpaper(context);
                                      setLockScreenWallpaper(context).then(
                                          (value) => Navigator.pop(context));
                                    },
                                    child: const Text("Both Screen"),
                                  ),
                                ],
                              );
                            });
                      },
                      title: "Apply",
                      icon: Icons.brush,
                      color: Colors.blue.withOpacity(0.9),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
