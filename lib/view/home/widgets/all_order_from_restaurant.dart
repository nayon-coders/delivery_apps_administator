import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utilitys/app_const.dart';
import '../../../utilitys/colors.dart';
import '../../delivery_boy_management/all_delivery.dart';
import '../screens/home.dart';

class AppOrdersFromRestaurentHomeWidget extends StatelessWidget {
  const AppOrdersFromRestaurentHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("order_from_restaurants").snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return SizedBox();
        }else if(snapshot.hasData){
          int pedingOrder = 0;
          int deliveryOrder = 0;
          int pickUp = 0;
          int totalOrders = 0;
          int cancelOrder = 0;
          int goToPickupOrder = 0;
          for(var i in snapshot.data!.docs!){
            if(i.data()["status"] == AppConst.status_pending){
              pedingOrder++;
            }else if(i.data()["status"] == AppConst.status_delivered){
              deliveryOrder++;
            }else if(i.data()["status"] == AppConst.status_pickup){
              pickUp++;
            }else if(i.data()["status"] == AppConst.status_cancel){
              cancelOrder++;
            }else if(i.data()["status"] == AppConst.status_go_to_pickup) {
              goToPickupOrder++;
            }
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Order From Restaturant",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeBox(
                    title: "Total Orders",
                    total: "${snapshot.data!.docs.length}",
                    color: AppColors.blue,
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Delivery())),
                  ),
                  SizedBox(width: 15,),
                  HomeBox(
                    title: "Pending",
                    total: "$pedingOrder",
                    color: Colors.blue,
                    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Delivery(status: AppConst.status_pending,))),
                  ),
                  SizedBox(width: 15,),
                  HomeBox(
                    title: "Go to Pickup",
                    total: "$goToPickupOrder",
                    color: Colors.orange,
                    onTap:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Delivery(status: AppConst.status_go_to_pickup,))),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HomeBox(
                    title: "Pick Up",
                    total: "$pickUp",
                    color: AppColors.indigo,
                    onTap:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Delivery(status: AppConst.status_pickup,))),
                  ),
                  SizedBox(width: 15,),
                  HomeBox(
                    title: "Delivered",
                    total: "$deliveryOrder",
                    color: Colors.green,
                    onTap:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Delivery(status: AppConst.status_delivered,))),
                  ),
                  SizedBox(width: 15,),
                  HomeBox(
                    title: "Cancel Orders",
                    total: "$pickUp",
                    color: Colors.red,
                    onTap:  ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Delivery(status: AppConst.status_cancel,))),
                  ),
                ],
              ),
            ],
          );
        }else{
          return Center(
            child: Text("No Data Found"),
          );
        }

      }
    );
  }
}
