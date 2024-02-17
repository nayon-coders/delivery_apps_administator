import 'package:driver/utilitys/colors.dart';
import 'package:flutter/material.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    super.key,
    required this.title, required this.onClick
  });

  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        onTap:onClick ,
        title: Text("$title",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 20),),
        trailing: Icon(Icons.double_arrow),
        tileColor: AppColors.babg,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
