import 'package:driver/utilitys/app_const.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/all_delivery.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';
class User_List extends StatefulWidget {
  const User_List({super.key});

  @override
  State<User_List> createState() => _User_ListState();
}

class _User_ListState extends State<User_List> {
  final _search=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.aapbg,
      appBar: AppBar(
        backgroundColor: AppColors.aapbg,
        title: Text(
          "Lista de repartidor",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
        centerTitle: true,
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: AppInput(title: "", hintText: "Buscar Delivery Body",prefixIcon: Icon(Icons.search,color: Colors.grey,), controller: _search),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
                gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                ) , itemBuilder: (_,index){
                return Container(
                  height: 220,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:30,top: 3),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: AssetImage("assets/images/boy.jpeg"),fit: BoxFit.cover)
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0,right: 2,bottom: 50,top: 1),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.edit,size: 15,)),
                          )
                        ],
                      ),

                      Text("Delivery Boy Name",
                        style: TextStyle(
                            fontWeight:FontWeight.w600,color: Colors.black,fontSize:15),),
                      Text("email@gmail.com",
                        style: TextStyle(
                            fontWeight:FontWeight.w600,color: Colors.black,fontSize:13),),
                      Text("01405120644",
                        style: TextStyle(
                            fontWeight:FontWeight.w600,color: Colors.black,fontSize:13),),
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
      )



    ));
  }
}
