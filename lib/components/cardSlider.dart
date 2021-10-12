// ignore_for_file: file_names, prefer_final_fields

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CardSlider extends StatefulWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  List<String> _image = [
    'assets/doctor.png',
    'assets/doctor.png',
    'assets/doctor.png'
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.12, top: 20),
      child: 
      CarouselSlider(
           options: CarouselOptions(
                    autoPlay: true,
                    //viewportFraction: 0.4,
                    //aspectRatio: 1.5,
                    enlargeCenterPage: true,
                   ),
           items: _image.map((e) => 
          Container(
                height: height * 0.25,
                width: width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: theme.primaryColorLight.withOpacity(0.3),
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
                          Text('Dr.', style: theme.textTheme.bodyText2),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SizedBox(
                                width: width * 0.3,
                                child: Text('JOHN BENJAMIN',
                                    style: theme.textTheme.headline4)),
                          ),
                          Text('Eye Specialist',
                              style: theme.textTheme.bodyText2)
                        ],
                      ),
                      Container(
                          height: 150,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Colors.white,
                          ),
                          child: Image.asset(e,
                              fit: BoxFit.cover))
                    ],
                  ),
                )),
         
          ).toList(),

 ));
  
  }
}

// CarouselSlider(
//            options: CarouselOptions(
//                     autoPlay: true,
//                     viewportFraction: 0.4,
//                     aspectRatio: 1.5,
//                     enlargeCenterPage: false,
//                    ),
//            items: _image.map((e) => Container(
          //   child: Image.network(e),
          // )).toList(),
// )

// ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(10),
//             child: Container(
//                 height: height * 0.25,
//                 width: width * 0.8,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: theme.primaryColorLight.withOpacity(0.5),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Dr.', style: theme.textTheme.bodyText2),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8),
//                             child: SizedBox(
//                                 width: width * 0.3,
//                                 child: Text('JOHN BENJAMIN',
//                                     style: theme.textTheme.headline4)),
//                           ),
//                           Text('Eye Specialist',
//                               style: theme.textTheme.bodyText2)
//                         ],
//                       ),
//                       Container(
//                           height: 150,
//                           width: 120,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             //color: Colors.white,
//                           ),
//                           child: Image.asset('assets/doctor.png',
//                               fit: BoxFit.cover))
//                     ],
//                   ),
//                 )),
//           );
//         },
//       ),
    
