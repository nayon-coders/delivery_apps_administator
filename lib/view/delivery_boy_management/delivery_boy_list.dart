import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/utilitys/app_const.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/delivery_boy_management/add_deliverboy.dart';
import 'package:driver/view/delivery_boy_management/all_delivery.dart';
import 'package:driver/view/delivery_boy_management/single_delivery_boy.dart';
import 'package:driver/view/home/screens/home.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:driver/widgets/app_networkimages.dart';
import 'package:flutter/material.dart';
class AllDeliveryBoy extends StatefulWidget {
  const AllDeliveryBoy({super.key});

  @override
  State<AllDeliveryBoy> createState() => _AllDeliveryBoyState();
}

class _AllDeliveryBoyState extends State<AllDeliveryBoy> {


  final _firestore = FirebaseFirestore.instance;

  final _search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.aapbg,
      appBar: AppBar(
        backgroundColor: AppColors.aapbg,
        leading: IconButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Home())),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text(
          "Lista de repartidor",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
      ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            AppInput(title: "", hintText: "Buscar Delivery Body",prefixIcon: Icon(Icons.search,color: Colors.grey,), controller: _search),
            SizedBox(height: 20,),
            StreamBuilder(
              stream: _firestore.collection("delivery_boys").snapshots(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator(),);
                }else if(snapshot.hasData){
                  //cehck is data id available or not
                  if(snapshot.data!.docs.length == 0){
                    return Center(child: Text("No data found"),);
                  }else{
                    return Expanded(
                      child: GridView.builder(
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                            mainAxisExtent: 250,
                          ) ,
                          itemBuilder: (_,index){
                            var data = snapshot.data!.docs[index]!; //get data
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: AppNetworkImage(imageUrl: data["profile"],),
                              ),
                              SizedBox(height: 10,),

                              Text(data["name"],
                                style: TextStyle(
                                    fontWeight:FontWeight.w600,color: Colors.black,fontSize:15),),
                              Text(data["email"],
                                style: TextStyle(
                                    fontWeight:FontWeight.w600,color: Colors.black,fontSize:13),),
                              Text(data["phone"],
                                style: TextStyle(
                                    fontWeight:FontWeight.w600,color: Colors.black,fontSize:13),),

                              SizedBox(height: 10,),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleDeliveryBoy(singleDeliveryBoy: data,)));  //go to single
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: data["status"] == "Active" ? AppColors.abgreen : data["status"] == "Pending" ? AppColors.bblue : Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(child: Text("${data["status"] }",style: TextStyle(color: Colors.white),)),

                                ),
                              ),

                            ],
                          ),
                        );
                      }),
                    );
                  }

                }else{
                  return Center(child: Text("No data found"),);
                }
              }
            ),
          ],
        ),
      ),
 
      floatingActionButton: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: FloatingActionButton(
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewDeliveryBoy())),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add,color: Colors.white,),
              Text("Add new",style: TextStyle(color: Colors.white),)
            ],
          ),
          backgroundColor: AppColors.black,
        ),
      ),



    ));
  }
}
