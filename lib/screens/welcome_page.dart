import 'package:flutter/material.dart';
import 'package:productivist/models/user.dart';
import 'package:productivist/screens/project_page.dart';
import 'package:productivist/screens/event_page.dart';

import 'package:productivist/screens/reminder_page.dart';
import 'package:productivist/screens/task_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:productivist/screens/calendar_page.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String formattedDate = DateFormat('EEE d MMM').format(DateTime.now());
  double completionRate =
      (currentUser.completed.length / currentUser.tasks.length).toDouble();
  int total = currentUser.reminders.length + currentUser.events.length + currentUser.tasks.length;

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
        backgroundColor: Color(0xFF1d284d),
      ),
      backgroundColor: Color(0xFF1d284d),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Color.fromRGBO(10, 51, 75, 1),
              ),
            ),
            ListTile(
              title: Text('Projects'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProjectPage()));
                setState(() {});
              },
            ),
            ListTile(
              title: Text('Calendar'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalendarPage()));
                setState(() {});
              },
            ),
          ],
        ),
      ),

      ///////////////////////////////// UI Design Starts Here //////////////////////////
      body: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                      child: Text(
                        "Welcome ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontFamily: "Montserrat-SemiBold",
                            letterSpacing: 1.0),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 20, 10),
                      child: Text(
                        "${currentUser.name}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontFamily: "Montserrat-Thin",
                            letterSpacing: 1.0),
                      ),
                    )
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(25, 5, 10, 10),
                    child: Text(
                      "$formattedDate",
                      style: TextStyle(
                          color: Colors.white30,
                          fontSize: 20.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: .5),
                    ),
                  )
                ],
              ),

////////////////////////// Forecast goes here ///////////////////////////
/// There should be 7 columns
/// First column should contain the count of items left uncompleted
/// Second column should contain the current date count of items
/// The rest should contain the consecutive weeks
/////////////////////////////////////////////////////////////////////////
              
              Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 25, 0, 0),
                      child: Text("Forecast",
                        style: TextStyle(
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 27,
                          color: Colors.tealAccent[400],
                          letterSpacing: 1,
                        )
                      ),
                    ),
                  ]
                ),


                //Forecast calendar days
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                          child: Text("Past",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              color: Colors.white,
                            )
                          ),
                        ),
                        // Count
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                          child: Text("1",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 25,
                              color: Colors.white,
                            )
                          ),
                        ),
                      ],
                    ),


                     Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("Mon",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              color: Colors.white,
                            )
                          ),
                        ),
                        // Count
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("${total}",
                            style: TextStyle(
                              fontFamily: 'Montserrat-Bold',
                              fontSize: 25,
                              color: Colors.tealAccent[400],
                            )
                          ),
                        ),
                      ],
                    ),


                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("Tue",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              color: Colors.white,
                            )
                          ),
                        ),
                        // Count
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("2",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 25,
                              color: Colors.white,
                            )
                          ),
                        ),
                      ],
                    ),


                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("Wed",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              color: Colors.white,
                            )
                          ),
                        ),
                        // Count
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("4",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 25,
                              color: Colors.white,
                            )
                          ),
                        ),
                      ],
                    ),


                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("Thu",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              color: Colors.white,
                            )
                          ),
                        ),
                        // Count
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("1",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 25,
                              color: Colors.white,
                            )
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("Fri",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              color: Colors.white,
                            )
                          ),
                        ),
                        // Count
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Text("0",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 25,
                              color: Colors.white,
                            )
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                          child: Text("Sat",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              color: Colors.white,
                            )
                          ),
                        ),
                        // Count
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 15, 0),
                          child: Text("1",
                            style: TextStyle(
                              fontFamily: 'Montserrat-SemiBold',
                              fontSize: 25,
                              color: Colors.white,
                            )
                          ),
                        ),
                      ],
                    ),


                  ]
                ),
//////////////////////////////////////////////////////////////////////////////////////////////////////
              /*Container(
                child: TableCalendar(
                  calendarStyle: CalendarStyle(
                    todayColor: Color.fromRGBO(10, 51, 75, 1),
                    selectedColor: Color(0xff01A0C7),
                  ),
                  calendarController: _controller,
                  initialCalendarFormat: CalendarFormat.week,
                ),
              ),*/

              // Row 1 Tasks & Events
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child:  GestureDetector(
                      onTap: () {
                        print(currentUser.completed.length /
                            currentUser.tasks.length);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TasksPage()));
                      },
                      child: Card(
                        color: Color(0xFF071030),
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                width: 140,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "Tasks",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.grey[100],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, bottom: 4),
                                        child: Text(
                                          "${currentUser.tasks.length} Total",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.grey[350],
                                          ),
                                        ),
                                      ),
                                        
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: new LinearPercentIndicator(
                                          width: 125,
                                          animation: true,
                                          lineHeight: 10.0,
                                          animationDuration: 2000,
                                          percent: completionRate,
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: Color(0xff01A0C7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventsPage()));
                      },
                      child: Card(
                        color: Color(0xFF071030),
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                width: 140,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "Events",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.grey[350],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, bottom: 4.0),
                                        child: currentUser.events.length != null
                                            ? Text(
                                                "${currentUser.events.length} Total",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey[100],
                                                ),
                                              )
                                            : Text(
                                                "${currentUser.events.length} Total",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey[100],
                                                ),
                                              ),
                                      ),
                                      
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: new LinearPercentIndicator(
                                          width: 125,
                                          animation: true,
                                          lineHeight: 10.0,
                                          animationDuration: 2000,
                                          percent: 0.9,
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: Color(0xff01A0C7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),),
                    ),
                ],
              ),

              // Row 2 Reminders & 
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child:  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RemindersPage()));
                      },
                      child: Card(
                        color: Color(0xFF071030),
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                width: 140,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "Reminders",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.grey[350],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8, bottom: 4),
                                        child:
                                            currentUser.reminders.length != null
                                                ? Text(
                                                    "${currentUser.reminders.length} Total",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.grey[100],
                                                    ),
                                                  )
                                                : Text(
                                                    "${currentUser.reminders.length} Total",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.grey[100],
                                                    ),
                                                  ),
                                      ),
                                      
                                      Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: new LinearPercentIndicator(
                                          width: 125,
                                          animation: true,
                                          lineHeight: 10.0,
                                          animationDuration: 2000,
                                          percent: 0.9,
                                          linearStrokeCap:
                                              LinearStrokeCap.roundAll,
                                          progressColor: Color(0xff01A0C7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                          width: 200,
                          height: 200,
                          child: GestureDetector(
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CalendarPage()));
                        setState(() {});
                      },
                      child: Card(
                        color: Color(0xFF071030),
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              SizedBox(
                                width: 140,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          "Calendar",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.grey[350],
                                          ),
                                        ),
                                      ),
                                     
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),),
                    ),
                ],
              ),

//////////////////////////////////////////////////////////////////////
              
                              

            ],
          ),
        ),
    );
  }
}
