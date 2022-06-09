import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constants.dart';
import '../login/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Text('3b3fa',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: kPrimaryColor, fontWeight: FontWeight.bold)),
            TextfieldContainer(
              size: size,
              child: TextField(
                controller: authController.name,
                decoration: InputDecoration(
                    hintText: 'Your Full Name',
                    fillColor: kPrimaryColor,
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    )),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
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
                    ),
                    suffixIcon: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          ' Send OTP',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () => authController.sendOTP(
                        authController.email.text.trim(),
                      ),
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
            TextfieldContainer(
              size: size,
              child: TextField(
                controller: authController.Opt,
                decoration: InputDecoration(
                  hintText: 'Enter OTP',
                  fillColor: kPrimaryColor,
                  border: InputBorder.none,
                  icon: Icon(
                    Icons.password,
                    color: kPrimaryColor,
                  ),
                ),
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
                      authController.validateOPT(
                          authController.email.text.trim(),
                          authController.Opt.text.trim());
                    },
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text(
                      'Verify OPT'.toUpperCase(),
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
            Obx(
              () => Text('Status : ${authController.status.value}',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: kPrimaryColor, fontWeight: FontWeight.bold)),
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
                      if (authController.verifiedOtp.value == true) {
                        authController.signUp();
                      } else {
                        Get.snackbar(
                          'Enter the correct OTP',
                          'Try Again',
                        );
                      }
                    },
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text(
                      'SignUp'.toUpperCase(),
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
                  'Already have an account ?',
                  style: TextStyle(color: kPrimaryColor),
                ),
                //========== add a functionality to this button =========
                TextButton(
                  onPressed: () {
                    Get.offAll(() => LoginScreen());
                  },
                  child: Text(
                    'Log In',
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
