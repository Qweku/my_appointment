// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final onTap;
  final String buttonText;
  final Color color;
  const Button({Key? key, required this.onTap, required this.buttonText, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black45,
                offset: Offset(1, 3),
                blurRadius: 5,
                )
          ],
          color: color,
        ),
        child: Text(
          buttonText,
          style: theme.textTheme.button,
        ),
      ),
    );
  }
}
