import 'package:flutter/material.dart';
import '../../constant/constants.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: kPrimaryLightColor,
              height: size.height * 0.3,
              width: size.width,
              child: Image.asset(
                'assets/images/3b3fa_light.png',
              ),
            ),
            SizedBox(
              height: size.width * 0.1,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                ),
                // ======= The Price of the ticket =====
                Text(
                  "050 0971 674",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                ),
                // ======= The Price of the ticket =====
                Text(
                  "3b3faapp@gmail.com",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'IG : ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  "3b3faapp",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.01,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'TWITTER : ',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                Text(
                  "3b3fa10",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '''
3b3fa is an event booking, ticket buying and selling app.
3b3fa stands to defy all odds in the ticket and event business.
It is easy to use, fast and very convinient.
No matter where the event is located 3b3fa got you covered.
3b3fa, Your ticket is a click away.

             ''',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
