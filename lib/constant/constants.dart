import 'package:flutter/material.dart';
import '../controllers/authController.dart';
import '../controllers/cart_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/product_controller.dart';
import '../controllers/users_bought_controller.dart';

const kPrimaryColor = Color(0xFF241c1c);
const kPrimaryLightColor = Color(0xFFebdbd3);
AuthController authController = AuthController.instance;
ticketController tickController = ticketController.instance;
HomeController homeController = HomeController.instance;
CartController cartController = CartController.instance;
UsersBoughtController usersBoughtController = UsersBoughtController.instance;
