import 'package:driver/utilitys/app_const.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/delivery_boy_management/add_deliverboy.dart';
import 'package:driver/view/delivery_boy_management/all_delivery.dart';
import 'package:driver/view/home/screens/home.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';
class AllDeliveryBoy extends StatefulWidget {
  const AllDeliveryBoy({super.key});

  @override
  State<AllDeliveryBoy> createState() => _AllDeliveryBoyState();
}

class _AllDeliveryBoyState extends State<AllDeliveryBoy> {
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
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                  ) , itemBuilder: (_,index){
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
                              image: DecorationImage(image: AssetImage("assets/images/boy.jpeg"),fit: BoxFit.cover)
                          ),
                        ),
                        SizedBox(height: 10,),

                        Text("Delivery Boy Name",
                          style: TextStyle(
                              fontWeight:FontWeight.w600,color: Colors.black,fontSize:15),),
                        Text("email@gmail.com",
                          style: TextStyle(
                              fontWeight:FontWeight.w600,color: Colors.black,fontSize:13),),
                        Text("01405120644",
                          style: TextStyle(
                              fontWeight:FontWeight.w600,color: Colors.black,fontSize:13),),

                        SizedBox(height: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Delivery()));
                          },
                          child: Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                              color: AppColors.abgreen,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Text("Active",style: TextStyle(color: Colors.white),)),

                          ),
                        ),

                      ],
                    ),
                  );
              }),
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
