import 'package:flutter/material.dart';
import 'package:productivist/models/user.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _controller;
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calendar Page"),
          backgroundColor: Color.fromRGBO(10, 51, 75, 1),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TableCalendar(
                calendarStyle: CalendarStyle(
                  todayColor: Color.fromRGBO(10, 51, 75, 1),
                  selectedColor: Color(0xff01A0C7),
                ),
                calendarController: _controller,
              )
            ],
          ),
        ));
  }
}
