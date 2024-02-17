import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/paymment_detials/widget/payment_detial_button.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class Payment_Detial extends StatefulWidget {
  const Payment_Detial({super.key});

  @override
  State<Payment_Detial> createState() => _Payment_DetialState();
}

class _Payment_DetialState extends State<Payment_Detial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historial de pagos",style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: AppColors.aapbg,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date:20/02/2024"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                Icon(Icons.cancel_presentation,size: 30,color: Colors.grey,)
              ],
            ),
            Text("\$25.90",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            RichText(text: TextSpan(
                text: "Status : ",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                  text:"Pending",
                  style: TextStyle(color: AppColors.oblue,fontWeight: FontWeight.w400)
                )
              ]
            ),),
            SizedBox(height: 10,),
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,top: 10),
                    child: Text("Payment Method Details"),
                  ),
                  ListTile(
                    title: Text("Bizum: "),
                    subtitle: Text("Account No. dsaj3243298023423"),
                    trailing: Icon(Icons.copy),
                  ),
                ],
              ),
            ),
            Text("Driver Info"),
            ListTile(
              leading: Image.asset(Assets.boy,fit: BoxFit.cover,),
              title: Text("Driver Info",style: TextStyle(fontWeight: FontWeight.w400),),
              subtitle: Text("Solicitud de retiro de pago"),
            ),
            SizedBox(height: 30,),
            Payment_detial_button(
                name: "Reject", color: AppColors.bred, onCleck: (){}),
            Payment_detial_button(
                name: "Paid", color: AppColors.abgreen, onCleck: (){}),

          ],
        ),
      ),
    );
  }
}


