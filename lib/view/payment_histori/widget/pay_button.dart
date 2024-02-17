import 'package:flutter/material.dart';
class Pay_Button extends StatelessWidget {
  const Pay_Button({
    super.key,required this.text,required this.color,
  });
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(text,style: TextStyle(color: Colors.white,fontSize: 15),)),
      ),
    );
  }
}