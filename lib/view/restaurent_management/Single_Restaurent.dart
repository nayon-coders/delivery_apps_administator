import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/firebase/controller/restaturen_controller.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/payment_histori/Payment_Histori.dart';
import 'package:driver/view/restaurent_management/create_restaturent.dart';
import 'package:driver/view/restaurent_management/widget/button.dart';
import 'package:driver/view/restaurent_management/widget/rich_text.dart';
import 'package:driver/widgets/app_alert.dart';
import 'package:driver/widgets/app_networkimages.dart';
import 'package:driver/widgets/app_tost.dart';
import 'package:driver/widgets/app_url_launcher.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import 'Todo_Restaurante.dart';
class Single_Restaurent extends StatefulWidget {
  final dynamic restaurent;
  const Single_Restaurent({super.key, this.restaurent});

  @override
  State<Single_Restaurent> createState() => _Single_RestaurentState();
}

class _Single_RestaurentState extends State<Single_Restaurent> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text("Single Restaurent",style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),),
        backgroundColor: AppColors.aapbg,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  child: AppNetworkImage(imageUrl: widget.restaurent!["image"], height: 250, width: MediaQuery.of(context).size!.width, fit: BoxFit.cover,))),
            SizedBox(height: 20,),
            AppRichText(text: "Name:", text2: "${widget.restaurent!["name"]}", ),
            AppRichText(text: "Email:", text2: "${widget.restaurent!["email"]}", ),
            AppRichText(text: "Phone:", text2: "${widget.restaurent!["phone"]}", ),
            AppRichText(text: "Location:", text2: "${widget.restaurent!["location"]["address"]}", ),
            AppRichText(
                text: "Status:",
                color: Colors.black,
                text2: "${widget.restaurent!["status"]}",
                color2: widget.restaurent!["status"] == "Deactivate" ? AppColors.bred : widget.restaurent!["status"] == "Pending" ? AppColors.bblue : AppColors.bgreen,
            ),
            SizedBox(height: 20,),
            PaymentHistoryButton(
              text: widget.restaurent!["status"] == "Deactivate" ? "Active" :"Deactivate",
              bgcolor: widget.restaurent!["status"] == "Deactivate" ? AppColors.bgreen : AppColors.bred,
              onCleck: ()=> widget.restaurent!["status"] == "Deactivate" ? AppAlert.showMyDialog(
                  context: context,
                  text: "You want to activate this Restaurant? If you activate this restaurant then it will use by restaurant owner.",
                  onOk: ()=> FirebaseRestaurentController.updateRetaurantStatus(id: widget!.restaurent!.id, status: "Active", context: context)
              ) : AppAlert.showMyDialog(
                context: context,
                text: "You want to deactivate this Restaurant? If you deactivate this restaurant then it will not use by restaurant owner.",
                onOk: ()=> FirebaseRestaurentController.updateRetaurantStatus(id: widget!.restaurent!.id, status: "Deactivate", context: context)
            ),

            ),
            PaymentHistoryButton(text: "Call Theme",icon: Icons.call, bgcolor: AppColors.bgreen,onCleck: ()=>AppUrlLauncher.makePhoneCall(widget.restaurent!["phone"]!),),
            PaymentHistoryButton(text: "Edit Information",icon: Icons.edit, bgcolor: AppColors.oblue,onCleck: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateRestaurent(restaurent: widget.restaurent!)));
            },),

            SizedBox(height: 30,),
            Divider(thickness: 1,),
            SizedBox(height: 30,),
            PaymentHistoryButton(
              text: "Delete Restaurant",
              icon: Icons.delete,
              bgcolor: AppColors.red,
              onCleck: ()=> AppAlert.showMyDialog(
                  context: context,
                  text: "You want to delete this Restaurant? If you delete this restaurant then it will not use by restaurant owner and it will be permanently deleted.",
                  onOk: ()=> FirebaseRestaurentController.deleteRestaurant(id: widget!.restaurent!.id, context: context)
              ),

             ),

          ]),
      ),
    );
  }
}




