import 'package:dotted_border/dotted_border.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/delivery_boy_management/all_delivery.dart';
import 'package:driver/view/all_product/All_Product.dart';
import 'package:driver/view/single_delivery/single_deliver.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';
class Select_Product extends StatefulWidget {
  const Select_Product({super.key});

  @override
  State<Select_Product> createState() => _Select_ProductState();
}

class _Select_ProductState extends State<Select_Product> {
  final _product=TextEditingController();
  final _repartidor=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,
      appBar: AppBar(
        title: Text("Crear un nuevo pedido",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        centerTitle: true,
        backgroundColor: AppColors.aapbg,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppInput(title: "Select Products", hintText: "Select Products", controller: _product),
                  AppInput(title: "Seleccionar repartidor", hintText: "Seleccionar repartidor", controller: _repartidor),
                  Text("Seleccione la ubicación de entrega",
                    style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: InkWell(
                      onTap: (){},
                      child: DottedBorder(
                        color: Colors.black,
                        strokeWidth: 2,
                        child:Container(
                            height: 100,
                            width: double.infinity,
                            color: Colors.white,
                            child: Image.asset("assets/images/gmap.png",fit: BoxFit.cover,)
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Dirección seleccionada:Dhaka 10025,Motijeel,Bangladesh",style: TextStyle(fontSize: 13),),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>All_Product()));
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    color: AppColors.bgreen,
                    child: Center(child: Text("Crear nueva entrega",style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
