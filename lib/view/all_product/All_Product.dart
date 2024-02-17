import 'package:driver/utilitys/colors.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
class All_Product extends StatefulWidget {
  const All_Product({super.key});

  @override
  State<All_Product> createState() => _All_ProductState();
}

class _All_ProductState extends State<All_Product> {
  final _SearchProduct = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,
      appBar: AppBar(
        title: Text("Ver todos los productos",style: TextStyle(fontWeight: FontWeight.w500),),
        backgroundColor: AppColors.aapbg,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 290,
                  child: TextField(
                    controller: _SearchProduct,
                    decoration: InputDecoration(
                      hintText: "Buscar producto",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.menu,color: Colors.white,),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (_,index){
                    return InkWell(
                      onTap: (){},
                      child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(Assets.shoe,height: 100,width: 200,fit: BoxFit.cover,),
                            SizedBox(height: 10,),
                            Text("Product Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,color: Colors.black,
                                fontSize: 20,
                              ),),

                            Text("12.65 \$",style: TextStyle(
                              fontWeight: FontWeight.w500,color: Colors.black,
                              fontSize: 20,
                            ),),

                          ],
                        ),
                      ),
                    );
                  }),
            )

          ],
        ),
      ),
    );
  }
}
