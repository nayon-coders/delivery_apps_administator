import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/widgets/app_tost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'notification_controller.dart';

class DeliveryController{

  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;

  //add new delivery boy in order from restaurent
  static Future<bool> addDeliveryBoyInOrderFromRestaurent({required BuildContext context, required Map<String, dynamic> data, required String docId})async {
    try {

      await _firestore.collection("order_from_restaurants").doc(docId).set(
          data, SetOptions(merge: true)).then((value) {
            //update status
            _firestore.collection("order_from_restaurants").doc(docId).update({"status": "Go to Pickup"}).then((value) {
              Navigator.pop(context);
              //send a push notification to the delivery boy
              NotificationController.sendNotification(
                  title: "Nuevo orden de entrega",
                  body: "Tienes un nuevo pedido para entregar.",
                  token: [data["delivery_boy"]["token"]]
              );

              //send notification to the restaurant owner
              NotificationController.sendNotification(
                  title: "Repartidor asignado para este pedido",
                  body: "Se ha asignado un repartidor para tu pedido.",
                  token: [data["restaurant_info"]["token"]]
              );

              AppToast.showToast("Delivery boy is set for this order.", Colors.green);
            });

      });
      return true;
    } catch (e) {
      return false;
    }
  }

}