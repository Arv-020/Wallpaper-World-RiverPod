import 'package:flutter/material.dart';
import 'package:wallpaper_world/models/wallapermodel.dart';

final List<String> bestOfTheMonth = [];

final List<Color> colorTone = [
  Colors.pinkAccent,
  Colors.blueAccent,
  Colors.blue,
  Colors.lightBlue,
  Colors.black,
  Colors.orange,
  Colors.purple
];
final List<String> colorsName = [
  "pink",
  "blue accent",
  "blue",
  "light blue",
  "black",
  "orange",
  "purple"
];

final List<WallpaperModel> categoryList = [
  WallpaperModel(category: "Art", img: [
    "https://wallpaperscute.com/wp-content/uploads/2018/02/Abstract-Mobile-Wallpaper-HD.jpg",
    // "https://wallpapercave.com/wp/wp7691212.jpg",
    // "https://wallpapercave.com/wp/wp2964464.jpg",
    // "https://1.bp.blogspot.com/-v7-mKW2O7e4/YApSZA-VWOI/AAAAAAAAQF8/BiRw35LIF7QZ7RV4i9ToQTfK2r-8rxaRACLcBGAsYHQ/d/abstract-wallpaper-for-mobile-18.jpg",
    // "https://wallpapercave.com/wp/wp5762034.jpg",
    // "https://1.bp.blogspot.com/-0CFLEPSjii8/YApTO1g19jI/AAAAAAAAQJ8/orMbNHdgIE4cIdVfYe_tgixUR4eH8YRhwCLcBGAsYHQ/d/abstract-wallpaper-for-mobile-10.jpg",
    // "https://wallpapercave.com/wp/wp5554846.jpg",
    // "https://i.pinimg.com/originals/1e/b0/61/1eb0619c7b702c0fc826718b7f91dfde.jpg",
    // "https://wallpapercave.com/wp/wp6437324.jpg",
    // "https://1.bp.blogspot.com/-qv93_GnaPXw/YApS8fzz7GI/AAAAAAAAQJQ/nJ8DOLjqmgYR8cpxqwtmAvwMx8xmhHpYgCLcBGAsYHQ/d/dark-abstract-wallpaper-iphone-54.jpg",
    // "https://lh5.googleusercontent.com/proxy/qTp7CrdOgFLUL3rYN4meqbm9hTYldZoJQkEjI3mL6QhEAbacipcPzkxrVQZwiBp5PvFpue0NlnpVoG9JswU6gwWAje9xr8Jk2rntjA=s0-d",
    // "https://1.bp.blogspot.com/-6bJFARuMbuQ/YApSgxd82aI/AAAAAAAAQGw/IIXnx5S7EMwbHT2CeCgMuH3u9UOAJ8nmQCLcBGAsYHQ/d/abstract-wallpaper-for-mobile-33.jpg",
    // "https://1.bp.blogspot.com/-K20nPV41dHI/X8ntR1WNeaI/AAAAAAAAOG4/HiL7M4uZo0wxtDrR_KZ24aDt4fLJd9_OgCLcBGAsYHQ/s0/abstract-4k.jpg",
    // "https://wallpapercave.com/wp/wp6573741.jpg",
    // "https://wallpapercave.com/wp/wp5735842.jpg",
    // "https://img.wallpapersafari.com/phone/640/1136/82/7/n9gF6b.jpg",
    // "https://th.bing.com/th/id/R.a9f2bca5c691e38e10dc51c74c8b4f97?rik=FtoZCJckyfQvBg&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f8%2fa%2fe%2f299248.jpg&ehk=RZsRQYiP1NhnIC9%2fV9BCwwU36JZONDHlf9%2fJNO5XV0U%3d&risl=&pid=ImgRaw&r=0",
    // "https://www.hdwallpapers.in/download/abstract_blue_4k_hd_abstract-1440x2560.jpg",
    // "https://1.bp.blogspot.com/-m47tnTYrcS4/YApSxVPWBJI/AAAAAAAAQII/EuIoqR0LCJQlTC3iFt_MpQ6SjPJBBOixgCLcBGAsYHQ/d/abstract-wallpaper-for-mobile-64.jpg",
    // "https://www.pixelstalk.net/wp-content/uploads/2016/10/Abstract-Phone-Backgrounds-Download.jpg",
    // "https://th.bing.com/th/id/OIP.OofWZoW9SJ4mZE5fzkIFxAHaNK?pid=ImgDet&rs=1"
  ]),
  WallpaperModel(category: "Nature", img: [
    "https://th.bing.com/th/id/OIP.p4koiRR4fGEvaCWVzumjNQHaNK?pid=ImgDet&rs=1",
    "https://i0.wp.com/techbeasts.com/wp-content/uploads/2016/01/nature-wallpapers-hd.jpg",
    "https://th.bing.com/th/id/R.9559a8f67c226a4050441fafdde60eb0?rik=fHW5DiRhDIsWQw&riu=http%3a%2f%2f4.bp.blogspot.com%2f-Tz7pIQtKG90%2fUMAwb8ToA2I%2fAAAAAAAAOjs%2f7o4_RrUxc0c%2fs1600%2fGreen%2bNature%2bWallpapers%2b10.jpg&ehk=S7W6QMtPiaiQ2Rdf5%2bV3BMS6FRYC%2bFzS4Fd0QfChmKY%3d&risl=&pid=ImgRaw&r=0",
    "https://wallpapercave.com/wp/wp6766867.jpg",
    "https://th.bing.com/th/id/OIP.yAmQHrj-E7x0f-1r527KWwHaNK?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/OIP.dVje3dOZZXqntNfISugDtwHaNK?pid=ImgDet&rs=1",
    "https://wallpaperaccess.com/full/157058.jpg",
    "https://wallpapercave.com/wp/wp6574376.jpg"
  ]),
  WallpaperModel(category: "Galaxy", img: [
    "https://wallpapercave.com/wp/wp5855076.jpg",
    "https://th.bing.com/th/id/R.40dace2ad9848b2c8072ac8bedc6d3b6?rik=BIvKT4JXqO%2fzjg&riu=http%3a%2f%2fgetphotos.eu%2fwp-content%2fuploads%2f2015%2f02%2fSpace-Galaxy-Smartphone-Wallpapers-HD.jpg&ehk=9lFwFRma93bmHZUQFBTkhxv23XoptREU%2fognaD9Shzw%3d&risl=&pid=ImgRaw&r=0",
    "https://www.pixelstalk.net/wp-content/uploads/2016/09/iPhone-Galaxy-Backgrounds-Free-Download.jpg",
    "https://wallpapercave.com/wp/wp5280631.jpg",
    "https://1.bp.blogspot.com/-2NUPMNIpKrQ/XbA8oUj3KpI/AAAAAAAAD3g/fP4MWl47mTwhV4iklqMAC-5rGRz1wvZOQCLcBGAsYHQ/s3120/galaxy.jpg",
    "https://wallpapercave.com/wp/wp5855064.png",
    "https://getwallpapers.com/wallpaper/full/8/a/6/1165955-galaxy-phone-wallpaper-1080x1920-for-ipad-pro.jpg",
    "https://wallpapercave.com/wp/wp5129294.jpg",
    "https://th.bing.com/th/id/OIP.lkKnAFjgyopshDYGDGvNbwHaNK?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/R.e95b7dfd91a9df7409411f483ebd7edb?rik=ghq84Uy8P2%2f6HA&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2f5%2f2%2f6%2f1290584-beautiful-wallpaper-for-lg-phone-1080x1920-for-pc.jpg&ehk=RvNTsb8RSEHvW0LWJnPohSmIoMQUkuD2D7GMz6tSWuw%3d&risl=&pid=ImgRaw&r=0",
    "https://sguru.org/wp-content/uploads/2017/09/Latest-Phone-Wallpaper-free-mobile-wallpaper-downloads-samsung-galaxy-s-iiii-4-1080x1920.jpg",
    "https://th.bing.com/th/id/R.714e93a2e48df8d256f38066192a2cf6?rik=vfVOGLHRhxEJSA&riu=http%3a%2f%2fgetwallpapers.com%2fwallpaper%2ffull%2fd%2fa%2f2%2f595851.jpg&ehk=KOe73uAkwKhthgA3avcYIoFmFjaHCwcQxz%2fpCgIn4U4%3d&risl=&pid=ImgRaw&r=0",
    "https://image.winudf.com/v2/image1/Y29tLm1vYmlsZXVuaXZlcnNpdHkuZ2FsYXh5X3NjcmVlbl80XzE1NDMyOTM0NjRfMDc1/screen-4.jpg?fakeurl=1&type=.jpg",
    "https://th.bing.com/th/id/OIP.-WGOAjKYxeNqdmxtHdnjugHaNL?pid=ImgDet&rs=1"
  ]),
  WallpaperModel(category: "Animals", img: [
    "https://wallpaperaccess.com/full/1321378.jpg",
    "https://wallpapercave.com/wp/wp5125277.jpg",
    "https://th.bing.com/th/id/OIP.bpYu2NTr1ekn7x9UTVithgHaNK?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/OIP.oVPVY-jqrpDe3AGx_Sjz0AHaNK?pid=ImgDet&rs=1",
    "https://th.bing.com/th/id/OIP.SPQIB6BHHsBNI2NzYbRSHwHaNK?pid=ImgDet&rs=1",
    "https://wallpapercave.com/wp/wp6266316.jpg",
    "https://wallpapercave.com/wp/wp5125283.jpg",
    "https://th.bing.com/th/id/OIP.2QJ_0NN0sBZvkA-DKuh_cwAAAA?pid=ImgDet&rs=1",
    "https://cdn.wallpapersafari.com/31/70/bMKHjm.jpg",
    "https://wallpapercave.com/wp/wp5840023.jpg",
    "https://i.pinimg.com/736x/8c/6f/71/8c6f71672075bcf7faf922416d4b51da.jpg",
    "https://th.bing.com/th/id/OIP._0kEZHdxQmYHsFJ3nYHONwHaNK?pid=ImgDet&rs=1",
    "https://bestwallpapers.net/wp-content/uploads/2020/01/Animals-Wallpapers-Download-Free-Animals-HD-Wallpapers-for-Mobile-6.jpeg",
    "https://image.winudf.com/v2/image/d2lsZC5hbmltYWwud2FsbHBhcGVyc3Nfc2NyZWVuXzBfeThlbGUydG4/screen-0.jpg?fakeurl=1&type=.jpg",
    "https://iphonewallpaperphoto.files.wordpress.com/2020/02/iphone-wallpaper-fox-1.png",
  ]),
  WallpaperModel(category: "Cars", img: [
    "https://wallpapercave.com/wp/wp2150865.jpg",
    "https://i.pinimg.com/originals/b6/d2/0c/b6d20c8172098184c9dbb669e3e7d29e.jpg",
    "https://wallpaperaccess.com/full/239050.jpg",
    "https://wallpapercave.com/wp/wp2990224.jpg",
    "https://wallpapercave.com/wp/wp5807157.jpg",
    "https://wallpapercave.com/wp/wp4402958.jpg",
    "https://wallpapercave.com/wp/wp5834283.jpg",
    "https://wallpapercave.com/wp/wp6768227.jpg",
    "https://wallpapercave.com/wp/wp5031845.jpg",
    "https://wallpapercave.com/wp/wp2990275.jpg",
    "https://avante.biz/wp-content/uploads/Cars-Wallpapers-Mobile/Cars-Wallpapers-Mobile-001.jpg",
    "https://3dandroidwallpaper.com/wp-content/uploads/2020/05/Android-Wallpaper-HD-Sport-Car.jpg",
    "https://www.mobilesmspk.net/user/images/wallpaper_images/2020/04/18/www.mobilesmspk.net_car_4699.jpg",
    "https://bestwallpapers.net/wp-content/uploads/2020/01/Lambroghini-car-phone-hd-wallpapers-free.jpg",
    "https://androidhdwallpapers.com/media/uploads/2016/04/Orange-McLaren-p1-concept-car-Wallpapers-For-iPhone-6.jpg",
    "https://cdn.wallpapersafari.com/22/75/edJCsi.jpg",
    "https://wallpapercave.com/wp/wp2275971.jpg",
    "https://cdn.wallpapersafari.com/72/43/oa8s2p.jpg",
    "https://cdn.wallpapersafari.com/96/40/4lHzbu.jpg",
    "https://1.bp.blogspot.com/-dSjrS0k-cbQ/T1OOBJ15g4I/AAAAAAAABI0/1Km_aEJkUzw/s1600/koenigsegg.jpg",
    "https://img.wallpapersafari.com/phone/640/1136/99/75/gNjR59.jpg",
    "https://th.bing.com/th/id/OIP.K_j-NAECjFYo66-Td5_P7QHaNK?pid=ImgDet&rs=1"
  ]),
  WallpaperModel(category: "Happy", img: [
    "https://th.bing.com/th/id/OIP.TbFiC5d0dHxx2aEn_kiOcQAAAA?pid=ImgDet&rs=1",
  ]),
];
