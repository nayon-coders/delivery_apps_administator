import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/view/delivery_management/select_delivery_boy.dart';
import 'package:driver/view/restaurent_management/Single_Restaurent.dart';
import 'package:driver/widgets/app_networkimages.dart';
import 'package:driver/widgets/app_url_launcher.dart';
import 'package:flutter/material.dart';
class SingleDelivery extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> data;
  const SingleDelivery({super.key, required this.data});

  @override
  State<SingleDelivery> createState() => _SingleDeliveryState();
}

class _SingleDeliveryState extends State<SingleDelivery> {

  double _totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i in widget.data!.data()!["items"]) {
      setState(() {
        _totalPrice +=
            double.parse("${i["qty"]}") * double.parse("${i["price"]}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.babg,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
        ),
        title: Text("Todas las entregas", style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),),
        backgroundColor: AppColors.aapbg,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("ID",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400),
                      ),
                      Text("#${widget.data.data()!["order_id"]}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Date", style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                      Text("${widget.data.data()!["create_at"]}", style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Status", style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                      Text(widget.data.data()!["status"], style: TextStyle(
                          color: widget.data.data()!["status"] == "Complete" ? Colors
                              .green : AppColors.blue,
                          fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Text("Entregas Productos",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
            SizedBox(height: 10,),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.data.data()!["items"].length,
                itemBuilder: (_, index) {
                  var product = widget.data.data()!["items"][index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      leading: AppNetworkImage(
                        imageUrl: product["product_image"],
                        height: 50,
                        width: 50,),
                      title: Text("${product["product_name"]}",
                        style: TextStyle(fontWeight: FontWeight.w600),),
                      subtitle: Text(
                          "${product["qty"]} X ${product["price"]} \$"),
                      trailing: Text("${(double.parse("${product["qty"]}") *
                          double.parse("${product["price"]}")).toStringAsFixed(
                          2)} \$"),
                      tileColor: Colors.white,
                    ),
                  );
                }
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text("Precio total",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
              trailing: Text("${_totalPrice.toStringAsFixed(2)} \$",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),

            SizedBox(height: 15,),
            Text("Restaturant Info",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
            SizedBox(height: 10,),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: AppNetworkImage(
                    imageUrl: widget.data.data()!["restaurant_info"]["image"],
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,),
                  title: Text("${widget.data.data()!["restaurant_info"]["name"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),),
                  subtitle: Text(
                    "Location: ${widget.data.data()!["restaurant_info"]["location"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 12),),
                  trailing: SizedBox(
                    width: 55,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () =>
                              AppUrlLauncher.makePhoneCall(widget
                                  .data.data()!["restaurant_info"]["phone"]),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Icon(
                              Icons.phone, color: Colors.white, size: 15,)),
                          ),
                        ),
                        SizedBox(width: 5,),
                        InkWell(
                          onTap: () =>
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => Single_Restaurent(
                                    restaurent: widget
                                        .data.data()!["restaurant_info"],))),
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(child: Icon(
                              Icons.remove_red_eye, color: Colors.white,
                              size: 15,)),
                          ),
                        ),

                      ],
                    ),
                  ),

                )
            ),
            SizedBox(height: 15,),
            SizedBox(height: 15,),

            Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery Location", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),),
                    SizedBox(height: 5,),
                    Text("${widget.data.data()!["delivery_address"]["location"]}",
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),),
                  ],
                )
            ),



            SizedBox(height: 20,),
            widget.data!.data()!["delivery_boy"] == null ? Column(
              children: [
                SizedBox(height: 15,),
                Text("Select the delivery boy",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                SizedBox(height: 10,),
                InkWell(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectDeliveryBoy(data: widget.data,))),
                  child: Container(
                    height: 60,
                    color: AppColors.bgreen,
                    child: Center(child: Text("Select Delivery Boy",
                      style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ],
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Delivery Boy Info",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                SizedBox(height: 10,),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: AppNetworkImage(
                        imageUrl: widget.data.data()!["delivery_boy"]["profile"],
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,),
                      title: Text("${widget.data.data()!["delivery_boy"]["name"]}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),),
                      subtitle: Text(
                        "${widget.data.data()!["delivery_boy"]["email"]}",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),),
                      trailing: InkWell(
                        onTap: () =>
                            AppUrlLauncher.makePhoneCall(widget
                                .data.data()!["delivery_boy"]["phone"]),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: Icon(
                            Icons.phone, color: Colors.white, size: 15,)),
                        ),
                      ),

                    )
                ),
              ],
            )

          ],
        ),
      ),
    );
  }



}
