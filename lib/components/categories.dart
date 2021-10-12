// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:my_appointment/screens/categoryDetails.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<String> _image = [
    'assets/eye.png',
    'assets/heart.png',
    'assets/tooth.png'
  ];

  List<String> _name = [
    'Eye Specialist',
    'Cardiologist',
    'Dentist'
  ];
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return SizedBox(
        height: height * 0.18,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GestureDetector(
                  onTap:(){
                    Navigator.push(
            context, MaterialPageRoute(builder: (context) => CategoryDetailsScreen()));
                  },
                  child: Container(
                    height: height * 0.18,
                    width: width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: theme.primaryColorLight,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(1, 2),
                            blurRadius: 5,
                          )
                        ]),
                        child:Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment:CrossAxisAlignment.center,
                          children:[
                            Image.asset(_image[index],height:50,width:50),
                            SizedBox(height: 5),
                            Text(_name[index],style:theme.textTheme.bodyText1)
                
                          ]
                        )
                  ),
                ),
              );
            }));
  }
}
