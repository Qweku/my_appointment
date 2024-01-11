// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AppointmentList extends StatefulWidget {
  final onSwipe;
  const AppointmentList({Key? key, this.onSwipe}) : super(key: key);

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList>
    with SingleTickerProviderStateMixin {
  late AnimationController anim1;

  @override
  void initState() {
    super.initState();
    anim1 =
        AnimationController(duration: Duration(milliseconds: 750), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: theme.primaryColorLight,
        // borderRadius: BorderRadius.only(
        //     topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black54,
        //     offset: Offset(1, 2),
        //     blurRadius: 5,
        //   )
        // ]
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              Text('Recent Appointments',
                  style: theme.textTheme.headlineMedium!
                      .copyWith(color: theme.primaryColor)),
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
                    child: Icon(Icons.list_alt, color: theme.primaryColorDark),
                  ),
                  Expanded(
                    child: Divider(color: theme.primaryColor),
                  )
                ]),
              ),
              Expanded(
                child: Container(
                    
                    color: theme.primaryColorLight,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(bottom: height * 0.05),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 750),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: theme.primaryColorLight,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(1, 2),
                                          blurRadius: 5,
                                        )
                                      ]),
                                  child: ListTile(
                                    //contentPadding: EdgeInsets.all(0),
                                      leading: Container(
                                          height: 80,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            //shape: BoxShape.circle,
                                            borderRadius: BorderRadius.circular(20),
                                            color: theme.primaryColor.withOpacity(0.4),
                                          ),
                                          child:
                                              Image.asset('assets/doctor.png')),
                                      title: Text('Dr. John Doe',
                                          style:
                                              theme.textTheme.bodyLarge!.copyWith(
                                            fontSize: 17,
                                          )),
                                      subtitle: Text('Dentist',
                                          style: theme.textTheme.bodyLarge),
                                      trailing: SizedBox(
                                        width: width * 0.2,
                                        child: Text('2 MONTHS AGO',
                                            textAlign: TextAlign.center,
                                            style: theme.textTheme.bodyLarge!
                                                .copyWith(color: theme.primaryColorDark)),
                                      )),
                                ),
                              ),
                              Divider()
                            ],
                          );
                        })),
              ),
            ],
          ),
          // Positioned(
          //   top: -height * 0.05,
          //   right: 0,
          //   left: 0,
          //   child: GestureDetector(
          //     onVerticalDragUpdate: widget.onSwipe,
          //     child: Container(
          //         height: 70,
          //         width: 70,
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: Colors.green,
          //         ),
          //         child: Center(
          //             child: Icon(Icons.keyboard_arrow_up,
          //                 color: theme.primaryColorLight, size: 30))),
          //   ),
          // )
        ],
      ),
    );
  }
}
