import 'package:flutter/material.dart';
class PaymentHistoryButton extends StatelessWidget {
  const PaymentHistoryButton({
    super.key,
    required this.text,this.icon,required this.bgcolor,required this.onCleck,
  });
  final String text;
  final Color bgcolor;
  final IconData? icon;
  final VoidCallback onCleck;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0,right: 20.0,top: 3,bottom: 3),
      child: InkWell(
        onTap: onCleck,
        child: Container(
          height: 60,
          width: 320,
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon != null ? Icon(icon, color: Colors.white,) : Center(),
              Text(text,style: TextStyle(color: Colors.white,fontSize: 20),),
            ],
          )),
        ),
      ),
    );
  }
}