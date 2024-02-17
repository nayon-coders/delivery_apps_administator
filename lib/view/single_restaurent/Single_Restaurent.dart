import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/payment_histori/Payment_Histori.dart';
import 'package:driver/view/single_restaurent/widget/button.dart';
import 'package:driver/view/single_restaurent/widget/rich_text.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
class Single_Restaurent extends StatefulWidget {
  const Single_Restaurent({super.key});

  @override
  State<Single_Restaurent> createState() => _Single_RestaurentState();
}

class _Single_RestaurentState extends State<Single_Restaurent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,
      appBar: AppBar(
        title: Text("Single Restaurent",style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: AppColors.aapbg,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
              height: 150,
                width: 200,
                child: Image.asset(Assets.imagesLogo)),),
          Text_rich(text: "Name:", color: Colors.black, text2: "Burritoville", color2: Colors.black),
          Text_rich(text: "Email:", color: Colors.black, text2: "Burritoville@gmail.com", color2: Colors.black),
          Text_rich(text: "Phone:", color: Colors.black, text2: "+0298323", color2: Colors.black),
          Text_rich(text: "Location:", color: Colors.black, text2: "Casa de Pollo; La Cocina Me..", color2: Colors.black),
          Text_rich(text: "Status:", color: Colors.black, text2: "Active", color2:AppColors.bgreen),
          SizedBox(height: 20,),
          PaymentHistoryButton(text: "Deactive", bgcolor: AppColors.bred,onCleck: (){},),
          PaymentHistoryButton(text: "Call Theme",icon: Icons.call, bgcolor: AppColors.bgreen,onCleck: (){},),
          PaymentHistoryButton(text: "Edit Information",icon: Icons.edit, bgcolor: AppColors.oblue,onCleck: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment_Histori()));
          },),
      ]),
    );
  }
}




