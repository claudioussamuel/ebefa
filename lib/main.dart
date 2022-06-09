import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'constant/firbase.dart';
import 'controllers/authController.dart';
import 'controllers/cart_controller.dart';
import 'controllers/home_controller.dart';
import 'controllers/product_controller.dart';
import 'controllers/users_bought_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialization.then((value) {
    Get.put(AuthController());
    Get.put(ticketController());
    Get.put(HomeController());
    Get.put(CartController());
    Get.put(UsersBoughtController());
  });
  runApp(const App());
}
