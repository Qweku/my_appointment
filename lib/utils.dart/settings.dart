import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: theme.textTheme.headline4,
        ),
        backgroundColor: theme.primaryColor,
      ),
      body: Container(
          height: height,
          decoration: BoxDecoration(
              color: theme.primaryColor,
              ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: theme.primaryColorLight,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.colorize,
                                  color: theme.primaryColorDark, size: 30),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 5, left: 5),
                                child: SizedBox(
                                  width: 90,
                                  child: Text("Regular-Theme",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyText1),
                                ),
                              )
                            ],
                          )),
                    ),
                    onTap: () {
                      getThemeManager(context).selectThemeAtIndex(0);
                    }),
                GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: theme.primaryColorLight,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.colorize,
                                  color: theme.primaryColorDark, size: 30),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 5, left: 5),
                                child: SizedBox(
                                  width: 90,
                                  child: Text("Blue-Theme",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyText1),
                                ),
                              )
                            ],
                          )),
                    ),
                    onTap: () {
                      getThemeManager(context).selectThemeAtIndex(1);
                    }),
                 GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: theme.primaryColorLight,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.colorize,
                                  color: theme.primaryColorDark, size: 30),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 5, left: 5),
                                child: SizedBox(
                                  width: 90,
                                  child: Text("Purple-Theme",
                                      textAlign: TextAlign.center,
                                      style: theme.textTheme.bodyText1),
                                ),
                              )
                            ],
                          )),
                    ),
                    onTap: () {
                      getThemeManager(context).selectThemeAtIndex(2);
                    }),
              ],
            ),
          )),
    );
  }
}
