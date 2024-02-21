import 'dart:convert';

import 'package:driver/app_config.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class NotificationController{

  //send notification to user
  static Future<bool> sendNotification({required String title, required String body, required List<String> token })async{
    var res = await http.post(Uri.parse(AppConfig.NOTIFICATION_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : AppConfig.FIREBASE_SERVER_KEY
        },
      body: jsonEncode({
        "registration_ids": token,
        "notification": {
          "body": body,
          "title": title,
          "android_channel_id": "pushnotificationapp",
          "sound": false
        }
      }
      )
    );
    if(res.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}