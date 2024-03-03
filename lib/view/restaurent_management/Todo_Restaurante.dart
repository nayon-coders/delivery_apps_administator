import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/home/screens/home.dart';
import 'package:driver/widgets/appButton.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:driver/widgets/app_networkimages.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import 'Single_Restaurent.dart';
import 'create_restaturent.dart';

class Restaturentmanagement extends StatefulWidget {
  const Restaturentmanagement({super.key});

  @override
  State<Restaturentmanagement> createState() => _RestaturentmanagementState();
}

class _RestaturentmanagementState extends State<Restaturentmanagement> {
  final _restaurant=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,

      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text("Todo Restaurante",style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),),
        backgroundColor: AppColors.aapbg,
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            AppInput(
              prefixIcon: Icon(Icons.search,color: Colors.grey,),
                hintText: "Buscar Restaurent", controller: _restaurant),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection("restaurants").snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(snapshot.hasError){
                    return Center(child: Text("Error: ${snapshot.error}"),);
                  }else if(snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                        itemBuilder: (_,index){
                        var data = snapshot.data!.docs[index]!;
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Single_Restaurent(restaurent: data,))),
                                leading: AppNetworkImage(imageUrl: data["image"], height: 50, width: 50,),
                                title: Text("${data["name"]}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                                subtitle: Text("Location: ${data["location"]["address"]}"),
                                tileColor: Colors.white,
                                trailing:InkWell(

                                  child: Container(
                                    height: 40,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.dgreen,
                                    ),
                                    child: Center(child: Text("Vista",style: TextStyle(color: Colors.white),)),
                                  ),
                                )
                            ),
                          );
                        });
                  }else{
                    return Center(child: Text("No Data Found"),);
                  }
                }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateRestaurent()))
      ),
    );
  }
}

