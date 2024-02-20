import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/firebase/controller/delivery_body_controller.dart';
import 'package:driver/firebase/controller/restaturen_controller.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/delivery_boy_management/add_deliverboy.dart';
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
class SingleDeliveryBoy extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>>? singleDeliveryBoy;
  const SingleDeliveryBoy({super.key, this.singleDeliveryBoy});

  @override
  State<SingleDeliveryBoy> createState() => _SingleDeliveryBoyState();
}

class _SingleDeliveryBoyState extends State<SingleDeliveryBoy> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("widget.restaurent!.data() ${widget.singleDeliveryBoy!.data()}");
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SizedBox(
                      child: AppNetworkImage(imageUrl: widget.singleDeliveryBoy!["profile"], height: 250, width: MediaQuery.of(context).size!.width, fit: BoxFit.cover,))),
              SizedBox(height: 20,),
              AppRichText(text: "Name:", text2: "${widget.singleDeliveryBoy!["name"]}", ),
              AppRichText(text: "Email:", text2: "${widget.singleDeliveryBoy!["email"]}", ),
              AppRichText(text: "Phone:", text2: "${widget.singleDeliveryBoy!["phone"]}", ),
              AppRichText(
                text: "Status:",
                color: Colors.black,
                text2: "${widget.singleDeliveryBoy!["status"]}",
                color2: widget.singleDeliveryBoy!["status"] == "Deactivate" ? AppColors.bred : widget.singleDeliveryBoy!["status"] == "Pending" ? AppColors.bblue : AppColors.bgreen,
              ),
              SizedBox(height: 20,),
              PaymentHistoryButton(
                text: widget.singleDeliveryBoy!["status"] == "Deactivate" ? "Active" :"Deactivate",
                bgcolor: widget.singleDeliveryBoy!["status"] == "Deactivate" ? AppColors.bgreen : AppColors.bred,
                onCleck: ()=> widget.singleDeliveryBoy!["status"] == "Deactivate" ? AppAlert.showMyDialog(
                    context: context,
                    text: "You want to activate this Delivery Boy? If you activate this Delivery Boy then it will use by Delivery Boy.",
                    onOk: ()=> FireabaseDeliveryBoyController.updateDeliveryBoyStatus(docId: widget!.singleDeliveryBoy!.id, status: "Active", context: context)
                ) : AppAlert.showMyDialog(
                    context: context,
                    text: "You want to deactivate this Delivery Boy? If you deactivate this restaurant then it will not use by Delivery Boy owner.",
                    onOk: ()=> FireabaseDeliveryBoyController.updateDeliveryBoyStatus(docId: widget!.singleDeliveryBoy!.id, status: "Deactivate", context: context)
                ),

              ),
              PaymentHistoryButton(text: "Call him",icon: Icons.call, bgcolor: AppColors.bgreen,onCleck: ()=>AppUrlLauncher.makePhoneCall(widget.singleDeliveryBoy!["phone"]!),),
              PaymentHistoryButton(text: "Edit Information",icon: Icons.edit, bgcolor: AppColors.oblue,onCleck: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewDeliveryBoy(data: widget.singleDeliveryBoy!)));
              },),

              SizedBox(height: 30,),
              Divider(thickness: 1,),
              SizedBox(height: 30,),
              PaymentHistoryButton(
                text: "Delete Delivery Boy",
                icon: Icons.delete,
                bgcolor: AppColors.red,
                onCleck: ()=> AppAlert.showMyDialog(
                    context: context,
                    text: "You want to delete this Delivery Boy? If you delete this restaurant then it will not use by restaurant owner and it will be permanently deleted.",
                    onOk: ()=> FireabaseDeliveryBoyController.deleteDeliveryBoy(docId: widget!.singleDeliveryBoy!.id, context: context)
                ),

              ),

            ]),
      ),
    );
  }
}




