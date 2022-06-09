import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/firbase.dart';
import '../models/user.dart';
import '../screens/home/homeScreen.dart';
import '../screens/login/login.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController Opt = TextEditingController();
  var userModel = UserModel().obs;
  var status = ''.obs;
  EmailAuth emailAuth = EmailAuth(sessionName: '3b3fa Tickets');
  Rx<bool> verifiedOtp = false.obs;
  Rx<bool> isVisible = true.obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  void signOut() async {
    auth.signOut();
  }

  void sendOTP(String email) async {
    var res = await emailAuth.sendOtp(
      recipientMail: email,
      otpLength: 5,
    );

    if (res) {
      status.value = 'OTP Sent';
    } else {
      status.value = 'Sending OTP failed';
    }
  }

  void validateOPT(String email, String otp) {
    var res = emailAuth.validateOtp(
      recipientMail: email,
      userOtp: otp,
    );

    if (res) {
      status.value = "OTP Verification succesful";
      verifiedOtp.value = true;
    } else {
      status.value = 'Wrong OTP';
    }
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      // ===== in case it doesnt work
      userModel.bindStream(listenToUser());
      Get.offAll(() => HomeScreen());
    }
  }

  void signIn() async {
    //showLoading();
    try {
      await auth.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      Get.offAll(() => HomeScreen());
      _clearControllers();
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Sign In Failed',
        'Try again',
        // snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signUp() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      )
          .then((result) {
        String _userId = result.user!.uid;
        // _addUserToFirestore(_userId);
        setUser(UserModel(
          name: name.text.trim(),
          email: email.text.trim(),
          id: _userId,
        ));
        _clearControllers();
      });
      Get.offAll(() => HomeScreen());
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Sign Up Failed',
        'Try again',
        //snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  ///====== getting all the users who
  ///created account name and email

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection('users')
      .doc(firebaseUser.value!.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromJson(snapshot));

  //======= Set new user =======
  Future<void> setUser(UserModel userModel) {
    return firebaseFirestore
        .collection('users')
        .doc(userModel.id)
        .set(userModel.toMap());
  }
}
