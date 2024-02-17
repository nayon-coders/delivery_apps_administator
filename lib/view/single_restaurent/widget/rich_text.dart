import 'package:flutter/material.dart';

import '../../../utilitys/colors.dart';


class Text_rich extends StatelessWidget {
  const Text_rich({
    super.key,
    required this.text,
    required this.color,
    required this.text2,
    required this.color2,
  });
  final String text;
  final String text2;
  final Color color;
  final Color color2;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: RichText(
          text: TextSpan(
          text: text,
          style: TextStyle(fontSize: 23,fontWeight: FontWeight.w500,color: color),
          children: [
            TextSpan(
              text:text2 ,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color:color2),
            )
          ]
      )),
    );
  }
}


