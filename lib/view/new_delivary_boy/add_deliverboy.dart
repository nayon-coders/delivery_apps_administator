import 'package:dotted_border/dotted_border.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/user_list/User_List.dart';
import 'package:flutter/material.dart';

class Add_Deliver extends StatefulWidget {
  const Add_Deliver({super.key});

  @override
  State<Add_Deliver> createState() => _Add_DeliverState();
}

class _Add_DeliverState extends State<Add_Deliver> {
  final _namecont=TextEditingController();
  TextEditingController _emailcont=TextEditingController();
  TextEditingController _phonecont=TextEditingController();
  TextEditingController _passcont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.aapbg,
        appBar: AppBar(
          elevation: 2.0,
          title: Text(
            "Crear nuevo repartidor",
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
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
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Full Name",style: TextStyle(
                              fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
                          TextField(
                            controller: _namecont,
                            decoration: InputDecoration(
                              hintText: "Full Name",
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
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
                          TextField(
                            controller: _emailcont,
                            decoration: InputDecoration(
                              hintText: "Email",
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
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phone Number",
                            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
                          TextField(
                            controller: _phonecont,
                            decoration: InputDecoration(
                              hintText: "Phone Number",
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
                    height: 100,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Create Password",
                            style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
                          TextField(
                            controller: _passcont,
                            decoration: InputDecoration(
                              hintText: "Type Password",
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
                          Text("Profile Image",
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.cloud_upload,size: 50,color: Colors.grey,),
                                    Text("Upload Image",style: TextStyle(fontSize: 20,color: Colors.black,),)
                                  ],
                                ),

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
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>User_List()));
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    color: AppColors.bgreen,
                    child: Center(child: Text("Crear nuevo repartidor",style: TextStyle(color: Colors.white),)),
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
