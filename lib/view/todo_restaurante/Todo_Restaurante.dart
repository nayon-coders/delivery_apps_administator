import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/single_delivery/single_deliver.dart';
import 'package:driver/view/single_restaurent/Single_Restaurent.dart';
import 'package:driver/widgets/appButton.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';

class Todo_Restaurant extends StatefulWidget {
  const Todo_Restaurant({super.key});

  @override
  State<Todo_Restaurant> createState() => _Todo_RestaurantState();
}

class _Todo_RestaurantState extends State<Todo_Restaurant> {
  final _restaurant=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        child: Icon(Icons.add,color: Colors.white,),
          onPressed: (){},
      ),
      appBar: AppBar(
        title: Text("Todo Restaurante",style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: AppColors.aapbg,
      ),
      body: Column(
        children: [
          AppInput(
            prefixIcon: Icon(Icons.search,color: Colors.grey,),
              title: "", hintText: "Buscar Restaurent", controller: _restaurant),
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
      )
    );
  }
}

