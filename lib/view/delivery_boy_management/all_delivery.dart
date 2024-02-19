import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/makedalivary/select_product/selectproduc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class All_Delivery extends StatefulWidget {
  const All_Delivery({super.key});

  @override
  State<All_Delivery> createState() => _All_DeliveryState();
}

class _All_DeliveryState extends State<All_Delivery> {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.aapbg,
      appBar: AppBar(
        title: Text("Todas las entregas",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
        centerTitle: true,
        backgroundColor: AppColors.aapbg,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:5,top: 10,),
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      height: 35,
                      width:180,
                      decoration: BoxDecoration(
                        color: AppColors.bgreen,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("Entrega Completa",style: TextStyle(color: Colors.white,fontSize: 13),)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5,top: 10),
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      height: 35,
                      width: 180,
                      decoration: BoxDecoration(
                        color: AppColors.bblue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text("Entrega pendiente",style: TextStyle(color: Colors.white,fontSize: 13),)),
                    ),
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: _firestore.collection("delivery_boys").snapshots(),
              builder: (context, snapshot) {
               if(snapshot.connectionState == ConnectionState.waiting){
                 return Center(child: CircularProgressIndicator(),);
               }else if(snapshot.hasData){
                 //check is data available or not
                 if(snapshot.data!.docs.length == 0){
                   return Center(child: Text("No data found"),);
                 }else{
                   return ListView.builder(
                       itemCount: snapshot.data!.docs.length ,
                       padding: EdgeInsets.all(10),
                       shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
                       itemBuilder: (_,index){
                         var data = snapshot.data!.docs![index]!;
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             alignment: Alignment.center,
                             height: 80,
                             width: 300,
                             decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10),
                             ),
                             child: Center(
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                   children: [
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       //crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Text("ID",
                                           style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                         ),
                                         Text("#7854",
                                           style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                         ),
                                       ],
                                     ),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       //crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Text("Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                         Text("22/02/2024",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                       ],
                                     ),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       //crossAxisAlignment: CrossAxisAlignment.center,
                                       children: [
                                         Text("Status",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                         Text("Completo",style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold)),
                                       ],
                                     ),
                                     Center(
                                       child: InkWell(
                                         onTap: (){
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Select_Product()));
                                         },
                                         child: Container(
                                           height: 40,
                                           width: 70,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(10),
                                             color: AppColors.dgreen,
                                           ),
                                           child: Center(child: Text("View",style: TextStyle(color: Colors.white),)),
                                         ),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           ),
                         );
                       });
                 }

               }else{
                  return Center(child: Text("No data found"),);
               }
              }
            ),

          ],
        ),
      ),
    );
  }
}
