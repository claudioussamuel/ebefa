import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:min_id/min_id.dart';
import '../../constant/constants.dart';
import '../../constant/firbase.dart';
import '../../generating_pdf/pdf_api.dart';
import '../../generating_pdf/pdf_invoice_api.dart';
import '../../models/UsersWhoBoughtTheTickectModel.dart';
import '../../models/ticket.dart';
import '../payment/pay_screen.dart';
import 'dart:convert';
import 'package:http/http.dart';

class DetailsScreen extends StatelessWidget {
  final TickectModel ticket;
  const DetailsScreen({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? url;

    makePayment(double? amount, String email, String? subAccount) async {
      Map<String, String> headers = {
        'Authorization':
            'Bearer sk_test_c92466e2d1031748ab44f1995df0a57e504f5221',
        'Content-Type': 'application/json'
      };
      Request request = Request(
        'POST',
        Uri.parse('https://api.paystack.co/transaction/initialize'),
      );
      request.body = json.encode({
        'email': email,
        'amount': amount! * 100,
        "subaccount": subAccount ?? '',
      });
      request.headers.addAll(headers);
      StreamedResponse response = await request.send();

      Map<String, dynamic> data;
      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        data = json.decode(await response.stream.bytesToString());
        url = data['data']['authorization_url'];
        print('$url  the original');
      } else {
        (response.reasonPhrase);
        url = "facebook.com";
      }
    }

    usersBoughtController.getTicketModel(ticket);
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          // color: Colors.white,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.07,
                  width: size.width * 0.8,
                  child: MaterialButton(
                    //==== for buying from paystack =====
                    onPressed: () async {
                      final pdfFile = await PdfInvoiceApi.generate(ticket);
                      PdfApi.openFile(pdfFile);

                      // add to the admin side
                      final userTickectId = MinId.getId();
                      cartController.addTicket(
                          ticket,
                          UsersWhoBoughtTheTickectModel(
                            email: auth.currentUser?.email,
                            name: authController.userModel.value.name,
                            id: userTickectId,
                          ));

                      cartController.addTicketBought(
                          ticket,
                          UsersWhoBoughtTheTickectModel(
                            email: auth.currentUser?.email,
                            name: authController.userModel.value.name,
                            id: userTickectId,
                            event: ticket.name,
                          ));

                      Get.snackbar(
                        'Successfully Booked ',
                        'Thank You',
                      );
                      makePayment(
                              ticket.price,
                              authController.userModel.value.email ?? "",
                              ticket.subAccountNumber)
                          .whenComplete(() => {
                                Get.to(() => PaymentScreen(
                                      url: url ?? '',
                                    ))
                              });

                      print('$url ' + 'the url is');
                    },

                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29),
                    ),
                    child: Text(
                      'Book Now'.toUpperCase(),
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
          )),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(size.width, 50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(ticket.picture ?? ""),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: size.height * 0.01,
              ),
              child: Text(
                ticket.name ?? "",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: kPrimaryColor),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                  ),
                ),
                // ======= work on the date here too =====
                Text(
                  ticket.date ?? '',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            // ====== start timne and end time
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.transparent,
                  ),
                ),
                Text(ticket.startTime ?? ""),
                SizedBox(width: 2),
                Text('-'),
                SizedBox(width: 2),
                Text(ticket.endTime ?? ""),
                SizedBox(width: 2),
                Text('GMT'),
              ],
            ),

            // ========= LOCATION =======
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.location_city,
                    color: Colors.grey,
                  ),
                ),
                // ======= town =====
                Text(
                  ticket.city ?? "",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            // ====== location
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.transparent,
                  ),
                ),
                Text(ticket.location!),
              ],
            ),
            // PRICE
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.money,
                    color: Colors.grey,
                  ),
                ),
                // ======= The Price of the ticket =====
                Text(
                  "The Price is GH₵ ${ticket.price ?? ''}",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: size.width * 0.1,
            ),
            Divider(
              height: 3,
            ),
            // ====== the abut heading =====
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
                vertical: size.height * 0.01,
              ),
              child: Text(
                'About',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: kPrimaryColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                ticket.description ?? "",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
