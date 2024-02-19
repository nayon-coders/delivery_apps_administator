import 'dart:io';
import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:driver/firebase/controller/authController.dart';
import 'package:driver/firebase/controller/delivery_body_controller.dart';
import 'package:driver/firebase/controller/image_controller.dart';
import 'package:driver/utilitys/colors.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewDeliveryBoy extends StatefulWidget {
  const CreateNewDeliveryBoy({super.key});

  @override
  State<CreateNewDeliveryBoy> createState() => _CreateNewDeliveryBoyState();
}

class _CreateNewDeliveryBoyState extends State<CreateNewDeliveryBoy> {
  final _name=TextEditingController();
  final _email=TextEditingController();
  final _phone=TextEditingController();
  final _password=TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.aapbg,
        appBar: AppBar(
          leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: Colors.black,),
          ),
          title: Text(
            "Crear nuevo repartidor",
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17, color: Colors.black),),
          backgroundColor: AppColors.aapbg,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppInput(title: "Full Name", hintText: "Full Name", controller: _name),
              SizedBox(height: 15,),
              AppInput(title: "Email", hintText: "Email", controller: _email),
              SizedBox(height: 15,),
              AppInput(title: "Phone Number", hintText: "Phone Number", controller: _phone),
              SizedBox(height: 15,),
              AppInput(title: "Create Password", hintText: "Type Password", controller: _password),
              SizedBox(height: 15,),
              Text("Profile Image",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
              SizedBox(height: 10,),
              InkWell(
                onTap: ()=> _showBottomSheet(0),
                child: DottedBorder(
                  color: Colors.black,
                  strokeWidth: 2,
                  child:Container(
                      height: 150,
                      width: 150,
                    color: Colors.white,
                    child: Center(
                      child: _profileImage != null ? Image.file(_profileImage!) : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_download_outlined,size: 30,),
                          Text("Upload Image"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Text("Documents Image",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
              SizedBox(height: 10,),
              InkWell(
                onTap: ()=> _showBottomSheet(1),
                child: DottedBorder(
                  color: Colors.black,
                  strokeWidth: 2,
                  child:Container(
                    height: 150,
                    width: 150,
                    color: Colors.white,
                    child: Center(
                      child: _documentsImage != null ? Image.file(_documentsImage!) : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.cloud_download_outlined,size: 30,),
                          Text("Upload Image"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

              InkWell(

                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.abgreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: ()=>_addDelivery(),
                    child: Center(child: _isLoading ? CircularProgressIndicator(color: Colors.white,) : Text("Crear nuevo repartidor",style: TextStyle(color: Colors.white),)),
                  ),
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }


  //show bottom sheet
  _showBottomSheet(index) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Text("Choose Photo",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20,),
                ListTile(
                  leading: new Icon(Icons.camera_alt_outlined),
                  title: new Text('Camera'),
                  onTap: () {
                    _takeImage(ImageSource.camera, index);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: new Icon(Icons.photo_camera_back),
                  title: new Text('Gallery'),
                  onTap: () {
                    _takeImage(ImageSource.gallery, index);
                    Navigator.pop(context);
                  },
                ),

              ],
            ),
          );
        });
  }

  //take image
  File? _profileImage, _documentsImage;
  _takeImage(ImageSource source, index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    print("pickedFile taken === ${File(pickedFile!.path)}");

    if (pickedFile != null) {
      if(index == 0){
        setState(() {
          _profileImage = File(pickedFile.path);
        });
      }else{
        setState(() {
          _documentsImage = File(pickedFile.path);
        });
      }

      //redirect to preview screen
      //once you are get the image now this time to get 60 days from to day
      print("image taken === ${File(pickedFile.path)}");
    }
  }

  _addDelivery()async{
    setState(() => _isLoading = true);
    int id = Random().nextInt(1000);

    print("id : $id");

    var imagePath, documentsPath;

    //convert image
    await ImageController.uploadImageToFirebaseStorage(_profileImage!).then((value) => setState((){imagePath = value;})  );
    await ImageController.uploadImageToFirebaseStorage(_documentsImage!).then((value) => setState((){documentsPath = value;})  );
    print("image url: $imagePath");

    //make a json object
    var data = {
      "id" : "$id",
      "type": "delivery_body",
      "name": _name.text,
      "email": _email.text,
      "phone": _phone.text,
      "password": _password.text,
      "profile": imagePath,
      "documents" : documentsPath,
      "status": "Active",
      "created_at": DateTime.now().toString(),
    };
    //send data to server
    await FireabaseDeliveryBoyController.addDeliveryBoy(context: context, data: data);  //send data to server
    await AuthController.signInWithEmailAndPassword(context: context, email: _email.text, pass: _password.text);

    //
    setState(() => _isLoading = false);

  }

  // _editRestaurent() async{
  //   setState(() => _isLoading = true);
  //   var imagePath;
  //
  //   //check if image is null
  //   if(_image == null ){
  //     //delete old image
  //     setState(() {
  //       imagePath = widget.restaurent!["image"];
  //     });
  //   }else{
  //     //convert image
  //     await ImageController.uploadImageToFirebaseStorage(_image!).then((value) => setState((){imagePath = value;})  );
  //     print("image url: $imagePath");
  //   }
  //
  //
  //
  //   //make a json object
  //   var data = {
  //     "id" : widget!.restaurent!.id,
  //     "type": "restaurant",
  //     "name": _name.text,
  //     "email": _email.text,
  //     "phone": _phone.text,
  //     "password": _pass.text,
  //     "location": _location.text,
  //     "image": imagePath,
  //     "status": "Active",
  //     "created_at": DateTime.now().toString(),
  //   };
  //   //send data to server
  //   await FirebaseRestaurentController.updateRestaurant(data,  widget!.restaurent!.id, context);
  //   setState(() => _isLoading = false);
  //
  // }


}
