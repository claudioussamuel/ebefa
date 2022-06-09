import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constants.dart';
import '../contact/contact_us.dart';
import '../tickets_bought/tickets_payed.dart';
import 'Ticket_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: kPrimaryColor),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '3b3fa',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
              centerTitle: true,
            ),
            floating: true,
            elevation: 0,
          ),
        ],
        body: Obx(
          () => homeController.connectionStatus.value == 1
              ? Container(
                  color: Colors.white30,
                  child: const TicketWidget(),
                )
              : Container(
                  color: kPrimaryLightColor,
                  child: Center(
                    child: Text('No Internet',
                        style: Theme.of(context).textTheme.headline2!.copyWith(
                            color: kPrimaryColor, fontWeight: FontWeight.bold)),
                  ),
                ),
        ),
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            Obx(() => UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                accountName: Text(
                  authController.userModel.value.name ?? "",
                  style: TextStyle(
                      //  color: Colors.white,
                      ),
                ),
                accountEmail:
                    Text(authController.userModel.value.email ?? ""))),
            ListTile(
              onTap: () {
                Get.to(() => TickectsBought());
              },
              leading: Icon(Icons.book_rounded),
              title: Text("Events booked"),
            ),
            ListTile(
              onTap: () {
                Get.to(() => ContactUs());
              },
              leading: Icon(Icons.help),
              title: Text("Contact us"),
            ),
            ListTile(
              onTap: () {
                authController.signOut();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
            ),
          ],
        ),
      ),
    );
  }
}
