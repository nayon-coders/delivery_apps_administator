import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/firebase/controller/delivery_controller.dart';
import 'package:driver/widgets/app_networkimages.dart';
import 'package:driver/widgets/app_tost.dart';
import 'package:flutter/material.dart';

import '../../utilitys/colors.dart';

class SelectDeliveryBoy extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
  const SelectDeliveryBoy({super.key, required this.data});

  @override
  State<SelectDeliveryBoy> createState() => _SelectDeliveryBoyState();
}

class _SelectDeliveryBoyState extends State<SelectDeliveryBoy> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.aapbg,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black,),

        ),
        title: Text("Select Delivery", style: TextStyle(color: Colors.black),) ,
        centerTitle: true,
        backgroundColor: AppColors.aapbg,
      ),

      body: Padding(
        padding:EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("delivery_boys").snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_,index) {
                  var data = snapshot.data!.docs[index]!;
                  return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: AppNetworkImage(imageUrl: data['profile'],
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,),
                          title: Text(data['name']),
                          subtitle: Text(data['phone']),
                          trailing: ElevatedButton(
                            onPressed: () {
                              setState(() => _isLoading = true);
                              Map<String, dynamic> orders  = {
                                ...widget.data.data(),
                                "delivery_boy" : data.data()
                              };




                             DeliveryController.addDeliveryBoyInOrderFromRestaurent(context: context, data: orders, docId: widget.data.id);
                              setState(() => _isLoading = true);
                             
                            },
                            child: _isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Select"),
                          ),
                        ),
                      )
                  );
                }
              );
            }else{
              return Center(
                child: Text("No data found"),
              );
            }
          },
        ),
      ),

    );

  }
}
