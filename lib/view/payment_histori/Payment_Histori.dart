import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/payment_histori/widget/pay_button.dart';
import 'package:driver/view/paymment_detials/Payment_Detial.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class Payment_Histori extends StatefulWidget {
  const Payment_Histori({super.key});

  @override
  State<Payment_Histori> createState() => _Payment_HistoriState();
}

class _Payment_HistoriState extends State<Payment_Histori> {
  final _payment=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,
      appBar: AppBar(
        title: Text("Historial de pagos",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        backgroundColor: AppColors.aapbg,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Pay_Button(text: "Pending", color: AppColors.indigo),
                Pay_Button(text: "Complete", color: AppColors.abgreen),
                Pay_Button(text: "Cancle", color: AppColors.bred),
              ],
            ),
            AppInput(
                title: "",
                hintText: "búsqueda de fecha",
                prefixIcon: Icon(Icons.calendar_today,color: Colors.grey,),
                controller: _payment,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Pending Withdraw List",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
            ),
            SizedBox(height: 10,),
            Expanded(child: ListView.builder(
              itemCount: 10,
                itemBuilder: (_,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Payment_Detial()));
                  },
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text("Date: 12-12-2024",),
                        ),
                        ListTile(
                          leading: Image.asset(Assets.boy,fit: BoxFit.cover,),
                          title: Text("Nayon Driver",style: TextStyle(fontWeight: FontWeight.w500),),
                          subtitle: Text("Solicitud de retiro de pago",
                            style: TextStyle(color: AppColors.bblue),),
                          trailing: Icon(Icons.keyboard_double_arrow_down,color: AppColors.abgreen,size: 30,),
                        ),
                        ListTile(

                          title: Text("Total:"),
                          subtitle: RichText(text: TextSpan(
                              text: "Status : ",
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text:"Pending",
                                  style: TextStyle(color:AppColors.oblue),
                                )
                              ]
                          )),
                          trailing: Text("\$25.90"),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }))



          ],
        ),
      ),
    );
  }
}


