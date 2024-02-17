import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/create_restaurante/create_restaturent.dart';
import 'package:driver/view/single_delivery/single_deliver.dart';
import 'package:driver/view/single_restaurent/Single_Restaurent.dart';
import 'package:driver/widgets/appButton.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';

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
          onPressed: ()=>Navigator.pop(context),
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
              child: ListView.builder(
                  itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListTile(
                    leading: Image.asset(Assets.imagesBland),
                    title: Text("Burritoville",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                    subtitle: Text("Location:  Casa de Pollo; La Cocina Me...."),
                    tileColor: Colors.white,
                    trailing:InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Single_Restaurent()));
                      },
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
              }),
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

