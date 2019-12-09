import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:productivist/models/user.dart';
import 'package:productivist/models/reminder.dart';

import 'package:intl/intl.dart';

class RemindersPage extends StatefulWidget {
  @override
  _RemindersPageState createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  String formattedDate;

  TextEditingController taskCtrl = TextEditingController();
  TextEditingController eventCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();
  TextEditingController timeCtrl = TextEditingController();
  TextEditingController locationCtrl = TextEditingController();
  Reminder newReminder = Reminder();
  int _currentValue = 0;
  int value = 0;

  List<String> items = [
    "Aberor",
    "Jesse",
    "Hey ",
    " You",
    "How",
    "Are ",
    "Yours",
    "Doing",
    "Today",
    "Now"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(15, 37, 51, 1),
        ),
        backgroundColor: Color.fromRGBO(15, 37, 51, 1),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Reminders",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: "Montserrat-SemiBold",
                          letterSpacing: -1),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: RawMaterialButton(
                        shape: CircleBorder(),
                        fillColor: Color.fromRGBO(10, 51, 75, 1),
                        elevation: 10,
                        child: Icon(
                          Icons.add,
                          size: 50,
                          color: Color(0xff01A0C7),
                        ),
                        onPressed: () {
                          print(currentUser.reminders);

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 20, 0, 15),
                                        child: Text(
                                          "Create a reminder",
                                          style: TextStyle(
                                            color: Color(0xFF071030),
                                            fontFamily: 'Montserrat-Bold',
                                            fontSize: 25,
                                            letterSpacing: -1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 20, 30, 10),
                                      child: Container(
                                        child: TextField(
                                          controller: taskCtrl,
                                          decoration: InputDecoration(
                                            hintText: 'Description',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(30, 0, 30, 20),
                                      child: Container(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.alarm,
                                              color: Colors.purpleAccent,
                                            ),
                                            onPressed: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime(2001),
                                                lastDate: DateTime(2222),
                                              ).then((date) {
                                                formattedDate =
                                                    DateFormat('EEE d MMM')
                                                        .format(date);
                                                setState(() {
                                                  newReminder.remind_at = date;

                                                  print(newReminder.remind_at);
                                                  print(formattedDate);
                                                });
                                              });
                                            },
                                          ),
                                          Text("Date"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          IconButton(
                                            icon: Icon(
                                              Icons.info_outline,
                                              color: Colors.redAccent,
                                            ),
                                            onPressed: () {
                                              // _buildItemPicker();
                                            },
                                          ),
                                          Text("Priority"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 40),
                                        child: Material(
                                          elevation: 5.0,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          color: Color(0xff01A0C7),
                                          child: MaterialButton(
                                            minWidth: 300,
                                            padding: EdgeInsets.fromLTRB(
                                                40, 5, 40, 5),
                                            onPressed: () {
                                              setState(() {
                                                newReminder.text =
                                                    taskCtrl.text;
                                              });
                                              currentUser.reminders
                                                  .add(newReminder);
                                            },
                                            child: Text("Add",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 20)
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                          ),
                                        )),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: currentUser.reminders.length,
                    itemBuilder: (_, i) {
                      formattedDate = DateFormat('EEE d MMM')
                          .format(currentUser.reminders[i].remind_at);
                      return Dismissible(
                        key: Key(UniqueKey().toString()),
                        onDismissed: (direction) {
                          currentUser.reminders.removeAt(i);
                          setState(() {});
                        },
                        background: Container(
                          color: Colors.red,
                        ),
                        child: CheckboxListTile(
                          checkColor: Colors.white,
                          activeColor: Color(0xff01A0C7),
                          title: !currentUser.reminders[i].completed
                              ? Text(
                                  currentUser.reminders[i].text,
                                  style: TextStyle(color: Colors.grey[100]),
                                )
                              : Text(
                                  currentUser.reminders[i].text,
                                  style: TextStyle(
                                      color: Colors.grey[20],
                                      decoration: TextDecoration.lineThrough),
                                ),
                          subtitle: Text(
                            "$formattedDate",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                          value: currentUser.reminders[i].completed,
                          onChanged: (value) {
                            currentUser.reminders[i].completed =
                                !currentUser.reminders[i].completed;
                            // currentUser.reminders[i].completed == true
                            //     ? currentUser.completed
                            //         .add(currentUser.reminders[i])
                            //     : currentUser.completed
                            //         .remove(currentUser.reminders[i].task);
                            print(currentUser.completed);
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
