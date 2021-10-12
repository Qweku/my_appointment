// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:my_appointment/components/cardSlider.dart';
import 'package:my_appointment/components/categories.dart';
import 'package:my_appointment/utils.dart/settings.dart';

import 'components/appointmentList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showList = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: theme.primaryColor,
        appBar: AppBar(
          actions: [
            IconButton(icon:Icon(Icons.settings),onPressed:(){
              Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
            })
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          //iconTheme:IconThemeData(color:theme.primaryColor)
        ),
        drawer: Drawer(
          child:ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  
                ),
                child: Center(
                  child: Container(
                    height: 100,width:100,
                    decoration: BoxDecoration(
                      shape:BoxShape.circle,
                      border:Border.all(color:theme.primaryColor)
                    ),
                    child: Center(child:Icon(Icons.local_hospital,color:theme.primaryColorDark,size:30))),
                ),),
                ListTile(
                  leading: Icon(Icons.list_alt,color:Colors.black),
                  title:Text('Appointments',style:theme.textTheme.bodyText1)
                ),
                ListTile(
                  leading: Icon(Icons.person,color:Colors.black),
                  title:Text('Profile',style:theme.textTheme.bodyText1)
                ),
                ListTile(
                  leading: Icon(Icons.logout,color:Colors.black),
                  title:Text('Log out',style:theme.textTheme.bodyText1)
                ),
            ],
          )
        ),
        body: Stack(
          children: [
            Container(
              height: height,
              //color: theme.primaryColorLight.withOpacity(0.7),
            ),
            Column(children: [
              Expanded(flex: 2, child: CardSlider()),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.primaryColorLight,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  ))
            ]),
            
            Visibility(
              visible:showList,

              child:Container(
                height:height,
                color:Colors.black.withOpacity(0.3),
              )
            ),
            Positioned(
                bottom: 0,
                //showList == false ? -height * 0.5 : -height*0.1,
                right: 0,
                left: 0,
                child: AppointmentList(onSwipe: (details) {
                  if (details.delta.dy > 0) {
                    setState(() {
                      showList = false;
                    });
                  }

                  if (details.delta.dy < 0) {
                    setState(() {
                      showList = true;
                    });
                  }
                })),
            Container(alignment: Alignment(0, 0), child: CategoryList()),
          ],
        ));
  }
}
