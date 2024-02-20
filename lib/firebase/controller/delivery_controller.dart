import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/widgets/app_tost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
              AppToast.showToast("Delivery boy is set for this order.", Colors.green);
            });

      });
      return true;
    } catch (e) {
      return false;
    }
  }

}