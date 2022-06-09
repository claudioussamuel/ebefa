import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constants.dart';
import '../../models/ticket.dart';
import 'singleProducts.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      (() => GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 0.63,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 10,
            children: tickController.tickets.map((TickectModel tickect) {
              return SingleTicketWidget(
                ticket: tickect,
              );
            }).toList(),
          )),
    );
  }
}
