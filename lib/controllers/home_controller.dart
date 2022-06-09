import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  var connectionStatus = 0.obs;

  late StreamSubscription<InternetConnectionStatus> _listener;

  @override
  void onInit() {
    super.onInit();
    _listener = InternetConnectionChecker().onStatusChange.listen(
      (event) {
        switch (event) {
          case InternetConnectionStatus.connected:
            connectionStatus.value = 1;
            break;
          case InternetConnectionStatus.disconnected:
            connectionStatus.value = 0;
            break;
        }
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    _listener.cancel();
  }
}
