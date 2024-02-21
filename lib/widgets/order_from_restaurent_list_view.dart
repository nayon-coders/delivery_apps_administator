import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utilitys/colors.dart';
import '../view/delivery_management/single_deliver.dart';
class OrderFromRestaurentListView extends StatefulWidget {
  final int? itemCount;
  final String? status;
  const OrderFromRestaurentListView({
    super.key,  this.itemCount, this.status ,
  });

  @override
  State<OrderFromRestaurentListView> createState() => _OrderFromRestaurentListViewState();
}

class _OrderFromRestaurentListViewState extends State<OrderFromRestaurentListView> {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var inputFormat = DateFormat('dd/MM/yyyy');

   List dataList = [];



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: StreamBuilder(
        stream: _firestore.collection("order_from_restaurants").snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasData){
            dataList.clear();
            if(widget.status != null ){
              if(snapshot.data!.docs.isNotEmpty){
                for(var i in snapshot.data!.docs){
                  if(i.data()["status"] == widget.status){
                    dataList.add(i.data());
                  }
                }
              }
            }else{
              for(var i in snapshot.data!.docs){
                  dataList.add(i.data());
              }
            }

            //print(dataList[0]);


            return dataList.isNotEmpty
                ? ListView.builder(
                itemCount:  widget.itemCount == null ? dataList.length : dataList.length > widget.itemCount! ? widget.itemCount : dataList.length,
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_,index){

                  var data = dataList[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("ID",
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),
                              ),
                              Text("#${data["order_id"]}",
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)),
                              Text("${data["create_at"]}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Status",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)),
                              Text(data["status"],style: TextStyle(color: data["status"] == "Complete" ? Colors.green : AppColors.blue,fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Center(
                            child: InkWell(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleDelivery(data: snapshot.data!.docs[index],))),
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
                  );
                })
                : Center(child: Text("No data found"),);
          }else{
            return Center(
              child: Text("No Data Found"),
            );
          }
        }
      ),
    );
  }
}

