// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_appointment/screens/doctorDetails.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final double rate;
  final onTap;
  final Color? color;
  final Color? textColor;
  const DoctorCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.rate,
      this.onTap, this.color, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DoctorDetails()));
      },
      child: Container(
          height: height * 0.25,
          width: width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dr.', style: theme.textTheme.bodyText1!.copyWith(color:textColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SizedBox(
                          width: width * 0.37,
                          child: Text(name, style: theme.textTheme.headline1!.copyWith(color:textColor))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("$rate", style: theme.textTheme.bodyText1!.copyWith(color:textColor)),
                        SizedBox(width: 5),
                        Icon(Icons.star, color: Colors.amber)
                      ],
                    )
                  ],
                ),
                Container(
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      //color: Colors.white,
                    ),
                    child: Image.asset(image, fit: BoxFit.cover))
              ],
            ),
          )),
    );
  }
}
