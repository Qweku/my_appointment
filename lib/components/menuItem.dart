// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String categoryName;
  final onTap;
  const MenuItem({Key? key, required this.icon, required this.categoryName, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: height * 0.13,
        width: height * 0.13,
        decoration: BoxDecoration(
          color:theme.primaryColor.withOpacity(0.3),

            shape: BoxShape.circle, 
            // boxShadow: [
            //   BoxShadow(
            //     color:Colors.black54,
            //     offset:Offset(1,2),
            //     blurRadius: 5,

                
            //   )
            // ]
            border: Border.all(color: theme.primaryColor)
            ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.red, size: 30),
              SizedBox(height: 5),
              Text(categoryName, style: theme.textTheme.bodyMedium)
            ]),
      ),
    );
  }
}
