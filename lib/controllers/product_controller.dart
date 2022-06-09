import 'package:get/get.dart';

import '../constant/firbase.dart';
import '../models/UsersWhoBoughtTheTickectModel.dart';
import '../models/ticket.dart';

class ticketController extends GetxController {
  static ticketController instance = Get.find();
  RxList<TickectModel> tickets = RxList<TickectModel>([]);
  String collection = "tickets";
  // TickectModel? ticket;

  @override
  void onReady() {
    super.onReady();
    tickets.bindStream(getAllTickets());
  }

  Stream<List<TickectModel>> getAllTickets() => firebaseFirestore
      .collection(
        collection,
      )
      .snapshots()
      .map(
        (query) => query.docs
            .map(
              (
                item,
              ) =>
                  TickectModel.fromJson(
                item.data(),
              ),
            )
            .toList(),
      );

  Future<void> addTicket(
      UsersWhoBoughtTheTickectModel usersWhoBoughtTheTickectModel,
      TickectModel tickectModel) {
    return firebaseFirestore
        .collection('admin')
        .doc(tickectModel.adminId)
        .collection(
          'tickets',
        )
        .doc(tickectModel.id)
        .collection('userwhoboughttickets')
        .doc(usersWhoBoughtTheTickectModel.id)
        .set(usersWhoBoughtTheTickectModel.toJson());
  }
}
