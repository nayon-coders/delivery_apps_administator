import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/restaurent_management/Single_Restaurent.dart';
import 'package:flutter/material.dart';
class Single_Delivery extends StatefulWidget {
  const Single_Delivery({super.key});

  @override
  State<Single_Delivery> createState() => _Single_DeliveryState();
}

class _Single_DeliveryState extends State<Single_Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,
      appBar: AppBar(
        title: Text("Todas las entregas",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        backgroundColor:AppColors.aapbg,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("ID",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        Text("#7854",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                        Text("22/02/2024",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Status",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                        Text("Completo",style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Entregas Productos",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/shoe.webp"),fit: BoxFit.cover,),
                title: Text("Product Name",style: TextStyle(fontWeight: FontWeight.w600),),
                subtitle: Text("10 X 19.98 \$"),
                trailing: Text("50.52 \$"),
                tileColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/shoe.webp"),fit: BoxFit.cover,),
                title: Text("Product Name",style: TextStyle(fontWeight: FontWeight.w600),),
                subtitle: Text("10 X 19.98 \$"),
                trailing: Text("50.52 \$"),
                tileColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image(image: AssetImage("assets/images/shoe.webp"),fit: BoxFit.cover,),
                title: Text("Product Name",style: TextStyle(fontWeight: FontWeight.w600),),
                subtitle: Text("10 X 19.98 \$"),
                trailing: Text("50.52 \$"),
                tileColor: Colors.white,
              ),
            ),
            ListTile(
              title: Text("Precio total",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              trailing: Text("50.52 \$"),
            ),
            ListTile(
              title: Text("Coste de envío",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              trailing: Text("50.52 \$",style: TextStyle(color: Colors.red),),
            ),
            Divider(),
            ListTile(
              title: Text("Usted obtiene",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
              trailing: Text("50.52 \$",style: TextStyle(color: AppColors.wgreen),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Información del repartidor",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/boy.jpeg"),
                  radius: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shakib Kb",
                      style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),),
                    Text("ShakibKb@gmail.com",
                      style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                    InkWell(
                      onTap: (){},
                      child: Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                          color: AppColors.bgreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(Icons.call,color: Colors.white,),
                              Text("Call Me",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                            ],
                          ),
                        ),
                      ),
                    ),
        
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Single_Restaurent()));
              },
              child: Container(
                height: 60,
                color: AppColors.bgreen,
                child: Center(child: Text("ver ubicación de entrega",style: TextStyle(color: Colors.white),)),
              ),
            )
        
          ],
        ),
      ),
    );
  }
}
