import 'package:flutter/material.dart';

import '../../../utilitys/colors.dart';


class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.text,
    this.color = Colors.black87,
    required this.text2,
    this.color2 = Colors.black,
  });
  final String text;
  final String text2;
  final Color color;
  final Color color2;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: RichText(
          text: TextSpan(
          text: "$text" ,
          style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: color),
          children: [
            TextSpan(
              text: " $text2" ,
              style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color:color2),
            )
          ]
      )),
    );
  }
}


