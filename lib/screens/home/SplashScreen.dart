import 'package:flutter/material.dart';

import '../../constant/constants.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryLightColor,
        child: Center(
          child: Text('3b3fa',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
