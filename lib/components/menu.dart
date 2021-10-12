// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'menuItem.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Center(
          child: Container(
              height: height * 0.35,
              width: height * 0.35,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.primaryColor)),
              child: Center(
                child: MenuItem(
                    icon: Icons.local_hospital, categoryName: 'Dentist'),
              )),
        ),
        Container(
          alignment: Alignment(-0.6, -0.5),
          child: MenuItem(icon: Icons.local_hospital, categoryName: 'Eye'),
        ),
        Container(
          alignment: Alignment(0.6, -0.5),
          child: MenuItem(
              icon: Icons.local_hospital, categoryName: 'Pediatrician'),
        ),
        Container(
          alignment: Alignment(-0.9, 0.2),
          child: MenuItem(
              icon: Icons.local_hospital, categoryName: 'Cardiologist'),
        ),
        Container(
          alignment: Alignment(0.9, 0.2),
          child:
              MenuItem(icon: Icons.local_hospital, categoryName: 'Vetenarian'),
        ),
        Container(
          alignment: Alignment(0, 0.65),
          child:
              MenuItem(icon: Icons.local_hospital, categoryName: 'Physician'),
        ),
      ],
    );
  }
}
