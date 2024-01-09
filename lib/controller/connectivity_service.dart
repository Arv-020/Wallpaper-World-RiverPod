import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { online, offline }

class ConnectivityService {
  StreamController<NetworkStatus> controller = StreamController();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((event) {
      controller.add(getNetworkStatus(event));
    });
  }

  NetworkStatus getNetworkStatus(ConnectivityResult result) {
    return result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }
}
