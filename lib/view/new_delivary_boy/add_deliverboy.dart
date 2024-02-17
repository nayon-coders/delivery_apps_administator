import 'package:dotted_border/dotted_border.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/payment_histori/widget/pay_button.dart';
import 'package:driver/view/paymment_detials/widget/payment_detial_button.dart';
import 'package:driver/view/user_list/User_List.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';

class Add_Deliver extends StatefulWidget {
  const Add_Deliver({super.key});

  @override
  State<Add_Deliver> createState() => _Add_DeliverState();
}

class _Add_DeliverState extends State<Add_Deliver> {
  final _name=TextEditingController();
  final _email=TextEditingController();
  final _number=TextEditingController();
  final _password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.aapbg,
        appBar: AppBar(
          elevation: 2.0,
          title: Text(
            "Crear nuevo repartidor",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          centerTitle: true,
          backgroundColor: AppColors.aapbg,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppInput(title: "Full Name", hintText: "Full Name", controller: _name),
              SizedBox(height: 15,),
              AppInput(title: "Email", hintText: "Email", controller: _email),
              SizedBox(height: 15,),
              AppInput(title: "Phone Number", hintText: "Phone Number", controller: _number),
              SizedBox(height: 15,),
              AppInput(title: "Create Password", hintText: "Type Password", controller: _password),
              SizedBox(height: 15,),
              Text("Profile Image",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              SizedBox(height: 10,),
              DottedBorder(
                color: Colors.black,
                strokeWidth: 2,
                child:Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.white,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_download_outlined,size: 30,),
                        Text("Upload Image"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.abgreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: (){},
                  child: Center(child: Text("Crear nuevo repartidor",style: TextStyle(color: Colors.white),)),
                ),
              ),

            ],
          ),
        ),

      ),

    );
  }
}
