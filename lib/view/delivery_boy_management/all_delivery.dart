import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/utilitys/app_const.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/order_from_restaurent_list_view.dart';

class All_Delivery extends StatefulWidget {
  final String? status;
  const All_Delivery({super.key, this.status});

  @override
  State<All_Delivery> createState() => _All_DeliveryState();
}

class _All_DeliveryState extends State<All_Delivery> {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var status;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.status != null) {
     setState(() {
       status = widget.status;
     });
    }else{
     setState(() {
          status = AppConst.status_pending;
        });
    }
  }

  List _status = [
    AppConst.status_pending,
    AppConst.status_go_to_pickup,
    AppConst.status_pickup,
    AppConst.status_delivered,
    AppConst.status_cancel
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.aapbg,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black,),

        ),
        title: Text("Todas las entregas",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black),),
        backgroundColor: AppColors.aapbg,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: _status.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      setState(() {
                        status = _status[index];
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: status == _status[index] ? AppColors.blue : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text(_status[index],style: TextStyle(color: status == _status[index] ? Colors.white : Colors.black,fontSize: 13),)),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 15,),
            Text("Status: $status",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10,),
            OrderFromRestaurentListView(status: status,),

          ],
        ),
      ),
    );
  }
}
