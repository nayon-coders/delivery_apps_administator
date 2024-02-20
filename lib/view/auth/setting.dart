import 'package:driver/firebase/controller/authController.dart';
import 'package:driver/widgets/appButton.dart';
import 'package:driver/widgets/app_inputs.dart';
import 'package:flutter/material.dart';

import '../../utilitys/app_const.dart';
import '../../utilitys/colors.dart';
import '../home/screens/home.dart';
import '../home/widgets/app_drawer.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  final _newPassword = TextEditingController();
  final _retypePassword = TextEditingController();
  final _email = TextEditingController();

  bool _showPassword = true;
  bool _isChangingEmail = false;
  bool _isPasswordChange = false;

  final _key = GlobalKey<FormState>();
  final _changeEmailKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.aapbg,
      appBar: AppBar(
        backgroundColor: AppColors.aapbg,
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text(
          "Setting",
          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Form(
              key: _key,
              child: Column(
                children: [
                  Text("Change You password",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 15,),
                  AppInput(
                    title: "New Password",
                    hintText: "New password",
                    controller: _newPassword,
                    obscureText: _showPassword,
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(_showPassword ?Icons.visibility: Icons.visibility_off, color: AppColors.bgColor,),),
                    validator: (v){
                      if(v!.isEmpty){
                        return "Password must not be empty.";
                      }else if(v!.length < 6){
                        return "Password must be at least 6 characters.";

                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15,),
                  AppInput(
                    title: "Re-Type Password",
                    hintText: "Re-Type password",
                    controller: _retypePassword,
                    obscureText: _showPassword,
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                      icon: Icon(_showPassword ?Icons.visibility: Icons.visibility_off, color: AppColors.bgColor,),),
                    validator: (v){
                      if(v!.isEmpty){
                        return "Confirm Password must not be empty.";
                      }else if(v!.toString() != _newPassword.text.toString()){
                        return "Password does not match.";
                      }else{
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 30,),
                  AppButton(text: "Change Your password",
                    onClick: ()async{
                      setState(() => _isChangingEmail = true);
                      if(_key.currentState!.validate()){
                        //call the method to change the email
                        await AuthController.changePassword(pass: _newPassword.text, context: context);
                      }
                      setState(() => _isChangingEmail = false);
                    },
                    isLoading: _isChangingEmail,
                    height: 50, width: 300,)
                ],
              ),
            ),
            // SizedBox(height: 30,),
            // Form(
            //   key: _changeEmailKey,
            //   child: Column(
            //     children: [
            //       Text("Change You Email",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w600,
            //           fontSize: 18,
            //         ),
            //       ),
            //       SizedBox(height: 15,),
            //       AppInput(
            //         title: "Email",
            //         hintText: "Email",
            //         controller: _email,
            //         validator: (v){
            //           if(v!.isEmpty){
            //             return "Email must not be empty.";
            //           }else{
            //             return null;
            //           }
            //         },
            //       ),
            //       SizedBox(height: 15,),
            //       AppButton(text: "Change Your Email",
            //         onClick: ()async{
            //         setState(() => _isChangingEmail = true);
            //         if(_changeEmailKey.currentState!.validate()){
            //           //call the method to change the email
            //           await AuthController.changeEmail(email: _email.text);
            //         }
            //         setState(() => _isChangingEmail = false);
            //
            //       },
            //         height: 50, width: 300,),
            //
            //
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
