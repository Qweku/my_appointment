// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_appointment/components/doctorCard.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String speciality, image;
  const CategoryDetailsScreen(
      {Key? key, required this.speciality, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: theme.primaryColorLight,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                        width: width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(40)),
                            color: theme.primaryColor,
                            image: DecorationImage(
                                image: AssetImage(image),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: EdgeInsets.only(top: height * 0.2, left: 20),
                          child: Text(speciality,
                              style: theme.textTheme.displayMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ))),
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: width,
                      child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: DoctorCard(
                                name: "JOHN BENJAMIN",
                                rate: 4.5,
                                color: theme.primaryColor.withOpacity(0.3),
                                image: 'assets/doctor.png',
                                textColor: theme.textTheme.bodyLarge!.color,
                              ),
                            );
                          }),
                    ))
              ],
            ),
            Positioned(
                top: height * 0.29,
                left: width * 0.1,
                child: Container(
                    height: height * 0.08,
                    width: height * 0.08,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.primaryColorLight,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 1),
                              color: Color(0xFF616161),
                              blurRadius: 5)
                        ]),
                    child: Center(child: Image.asset(image))))
          ],
        ));
  }
}
