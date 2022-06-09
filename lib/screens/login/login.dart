import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constants.dart';
import '../signup/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isVisible = true;
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Text('3b3fa',
                style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold)),
            TextfieldContainer(
              size: size,
              child: TextField(
                controller: authController.email,
                decoration: InputDecoration(
                    hintText: 'Your Email',
                    fillColor: kPrimaryColor,
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.mail,
                      color: kPrimaryColor,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            TextfieldContainer(
              size: size,
              child: Obx(
                (() => TextField(
                      controller: authController.password,
                      obscureText: authController.isVisible.value,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              authController.isVisible.value =
                                  !authController.isVisible.value;
                            },
                            icon: Icon(
                              authController.isVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: kPrimaryColor,
                            ),
                          ),
                          hintText: 'Your Password',
                          fillColor: kPrimaryColor,
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                          )),
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.8,
                  child: MaterialButton(
                    onPressed: () {
                      authController.signIn();
                    },
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text(
                      'Login'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(color: kPrimaryColor),
                ),
                //========== add a functionality to this button =========
                TextButton(
                  onPressed: () {
                    Get.offAll(() => SignUpScreen());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TextfieldContainer extends StatelessWidget {
  final Widget child;
  const TextfieldContainer({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      width: size.width * 0.8,
      height: size.height * 0.08,
      decoration: BoxDecoration(
          color: kPrimaryLightColor, borderRadius: BorderRadius.circular(29)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
