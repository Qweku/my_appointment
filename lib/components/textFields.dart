// ignore_for_file: file_names, prefer_const_constructors
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateTextField extends StatelessWidget {
  const DateTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fromDate = TextEditingController();
    final dateformat = DateFormat("yyyy-MM-dd");
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Theme(
          data: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
              accentColor: Colors.white,
            ),
          ),
          child: DateTimeField(
            style: theme.textTheme.bodyText1,
            decoration: InputDecoration(
              hintText: "Date",
              prefixIcon: Icon(Icons.calendar_today, color: Colors.black),
              border: InputBorder.none,
              hintStyle: theme.textTheme.bodyText1,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            ),
            // validator: MultiValidator([
            //   RequiredValidator(
            //       errorText: "*field cannot be empty"),
            // ]),
            format: dateformat,
            controller: fromDate,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
            },
          ),
        ),
      ),
    );
  }
}

class TimeTextField extends StatelessWidget {
  const TimeTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeformat = DateFormat("HH:mm");
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Theme(
          data: ThemeData.from(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.green,
              accentColor: Colors.white,
            ),
          ),
          child: DateTimeField(
            style: theme.textTheme.bodyText1,
            decoration: InputDecoration(
              hintText: "Time",
              prefixIcon: Icon(Icons.watch, color: Colors.black),
              border: InputBorder.none,
              hintStyle: theme.textTheme.bodyText1,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            ),
            // validator: MultiValidator([
            //   RequiredValidator(
            //       errorText: "*field cannot be empty"),
            // ]),
            format: timeformat,
            //controller: fromDate,
            onShowPicker: (context, currentValue) async {
              final time = await showTimePicker(
                context: context,
                initialTime:
                    TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
              );
              return DateTimeField.convert(time);
            },
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboard;
  final int? maxLines;
  final Color borderColor;
  final Color color;
  final TextStyle? style;
  final bool obscure;
  final Widget? suffixIcon;
  const CustomTextField(
      {Key? key,
      this.hintText,
      this.controller,
      this.keyboard,
      this.maxLines,
      this.borderColor = Colors.transparent,
      this.color = Colors.transparent,
      this.style,
      this.obscure = false, this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          color: color,
          borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        obscureText: obscure,
        maxLines: maxLines,
       
        keyboardType: keyboard,
        controller: controller,
        textAlign: TextAlign.justify,
        style: style,
        decoration: InputDecoration(
          hintText: hintText, 
          suffixIcon:suffixIcon,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
        ),
        // validator: MultiValidator([
        //   EmailValidator(errorText: ""),
        //   RequiredValidator(errorText: ""),
        // ]),
      ),
    );
  }
}
