// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:my_appointment/components/button.dart';
import 'package:my_appointment/components/doctorCard.dart';
import 'package:my_appointment/components/textFields.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bookForm() {
    final theme = Theme.of(context);
    return showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
              elevation: 0,
              backgroundColor: theme.primaryColorLight.withOpacity(0.9),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("BOOK", style: theme.textTheme.displaySmall),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(children: [
                      Expanded(
                        child: Divider(
                          color: theme.primaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.menu_book,
                            color: theme.primaryColorDark),
                      ),
                      Expanded(
                        child: Divider(color: theme.primaryColor),
                      )
                    ]),
                  ),
                ],
              ),
              content: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    //color: theme.primaryColor.withOpacity(0.3)
                  ),
                  child: Column(
                    children: [
                      DateTextField(),
                      SizedBox(height: 10),
                      TimeTextField()
                    ],
                  )),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Button(
                    buttonText: "DONE",
                    color: theme.primaryColor,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(40)),
                  color: theme.primaryColor,
                ),
                child: DoctorCard(
                    name: "JOHN BENJAMIN",
                    rate: 4.5,
                    image: 'assets/doctor.png',
                    color: Colors.transparent,
                    textColor: theme.textTheme.bodyMedium!.color),
              )),
              Expanded(
                  flex: 2,
                  child: SizedBox(
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: ListView(
                          padding: EdgeInsets.only(top: height * 0.08),
                          children: [
                            ListTile(
                              leading: Icon(Icons.local_hospital,
                                  color: theme.primaryColorDark),
                              title: Text('HOSPITAL',
                                  style: theme.textTheme.bodyLarge),
                              subtitle: Text('BLUE SKY CITY HOSPITAL',
                                  style: theme.textTheme.displaySmall!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ),
                            ListTile(
                              leading: Icon(Icons.place,
                                  color: theme.primaryColorDark),
                              title: Text('LOCATION',
                                  style: theme.textTheme.bodyLarge),
                              subtitle: Text('NORTH HILL',
                                  style: theme.textTheme.displaySmall!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ),
                            ListTile(
                              leading: Icon(Icons.medical_services,
                                  color: theme.primaryColorDark),
                              title: Text('SPECIALIZATION',
                                  style: theme.textTheme.bodyLarge),
                              subtitle: Text('EYE SPECIALIST',
                                  style: theme.textTheme.displaySmall!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ),
                            ListTile(
                              leading: Icon(Icons.watch,
                                  color: theme.primaryColorDark),
                              title: Text('WORKING HOURS',
                                  style: theme.textTheme.bodyLarge),
                              subtitle: Text('8:30 AM - 7:00 PM',
                                  style: theme.textTheme.displaySmall!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone_iphone,
                                  color: theme.primaryColorDark),
                              title: Text('CONTACT',
                                  style: theme.textTheme.bodyLarge),
                              subtitle: Text('+233-550875633',
                                  style: theme.textTheme.displaySmall!
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      )))
            ],
          ),
          Positioned(
              top: height * 0.29,
              left: width * 0.1,
              right: width * 0.1,
              child: Container(
                  height: height * 0.1,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme.primaryColorLight,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            color: Color(0xFFBDBDBD),
                            blurRadius: 5)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '13',
                            style: theme.textTheme.displayLarge!
                                .copyWith(color: theme.primaryColor),
                          ),
                          Text(
                            'Patients',
                            style: theme.textTheme.bodyLarge!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '4.5',
                            style: theme.textTheme.displayLarge!
                                .copyWith(color: theme.primaryColor),
                          ),
                          Text(
                            'Rate',
                            style: theme.textTheme.bodyLarge!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '5',
                            style: theme.textTheme.displayLarge!
                                .copyWith(color: theme.primaryColor),
                          ),
                          Text(
                            'Experience',
                            style: theme.textTheme.bodyLarge!
                                .copyWith(fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ))),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 1),
                      color: Colors.black12,
                      blurRadius: 5,
                    )
                  ]),
                  child: Button(
                      buttonText: 'BOOK',
                      color: theme.primaryColor,
                      onTap: () {
                        bookForm();
                      })))
        ],
      ),
    );
  }
}
