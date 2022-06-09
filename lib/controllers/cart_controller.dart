import 'package:get/get.dart';
import '../constant/firbase.dart';
import '../models/UsersWhoBoughtTheTickectModel.dart';
import '../models/ticket.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();

  Future<void> addTicket(
    TickectModel tickectModel,
    UsersWhoBoughtTheTickectModel usersWhoBoughtTheTickectModel,
  ) {
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

// this is added to the user
  Future<void> addTicketBought(
    TickectModel tickectModel,
    UsersWhoBoughtTheTickectModel usersWhoBoughtTheTickectModel,
  ) {
    return firebaseFirestore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .collection('userwhoboughttickets')
        .doc(usersWhoBoughtTheTickectModel.id)
        .set(usersWhoBoughtTheTickectModel.toJson());
  }

  Future<void> removeTickectsAdmin(String id) {
    return firebaseFirestore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .collection(
          'userwhoboughttickets',
        )
        .doc(id)
        .delete();
  }
}
