import 'package:flutter/material.dart';
import 'package:productivist/models/user.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:productivist/screens/calendar_page.dart';
import 'package:intl/intl.dart';

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Projects"),
        backgroundColor: Color.fromRGBO(10, 51, 75, 1),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(currentUser.projects[0].title),
            )
          ],
        ),
      ),
    );
  }
}
