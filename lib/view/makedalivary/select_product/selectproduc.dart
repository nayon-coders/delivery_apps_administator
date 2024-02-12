import 'package:dotted_border/dotted_border.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/single_delivery/single_deliver.dart';
import 'package:flutter/material.dart';
class Select_Product extends StatefulWidget {
  const Select_Product({super.key});

  @override
  State<Select_Product> createState() => _Select_ProductState();
}

class _Select_ProductState extends State<Select_Product> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Products",style: TextStyle(
                            fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Select Products",
                            filled: true,
                            fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),

                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              )

                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Seleccionar repartidor",
                          style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
                        TextField(

                          decoration: InputDecoration(
                            hintText: "Seleccionar repartidor",
                            filled: true,
                            fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),

                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Seleccione la ubicación de entrega",
                          style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
                        InkWell(
                          onTap: (){},
                          child: DottedBorder(
                            color: Colors.black,
                            strokeWidth: 2,
                            child:Container(
                              height: 150,
                              width: double.infinity,
                              color: Colors.white,
                              child: Image.asset("assets/images/gmap.png",fit: BoxFit.cover,)

                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Dirección seleccionada:Dhaka 10025,Motijeel,Bangladesh",style: TextStyle(fontSize: 13),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Single_Delivery()));
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
    );
  }
}
