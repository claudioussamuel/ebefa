import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/ticket.dart';
import '../details_screen/DetailedScreen.dart';

class SingleTicketWidget extends StatelessWidget {
  final TickectModel ticket;
  const SingleTicketWidget({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        // this part should pass data from this place to the detailed screen
        onTap: () {
          Get.to(() => DetailsScreen(ticket: ticket));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 190,
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: Colors.blue,
                    image: DecorationImage(
                      image: NetworkImage(ticket.picture ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                ticket.name ?? "",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                ticket.location!,
                style: TextStyle(color: Colors.grey),
              ),
              // color: Colors.grey,

              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "₵${ticket.price ?? ''}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),

//================== this part is static
//================== add to the data base
                  Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Text(
                      "${ticket.date ?? ''}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
