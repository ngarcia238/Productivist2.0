import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivist/models/user.dart';
import 'package:productivist/models/task.dart';
import 'package:numberpicker/numberpicker.dart';
import 'dart:async';

import 'package:productivist/screens/datetime_picker.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  TextEditingController taskCtrl = TextEditingController();
  TextEditingController updateTaskCtrl = TextEditingController();
  Task newTask = Task();
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

  Widget _buildItemPicker() {
    return CupertinoPicker(
      itemExtent: 60.0,
      backgroundColor: CupertinoColors.white,
      onSelectedItemChanged: (index) {
        setState(() {
          _currentValue = index;
        });
        print(index);
      },
      children: new List<Widget>.generate(items.length, (index) {
        return new Center(
          child: Text(
            items[index],
            style: TextStyle(fontSize: 22.0),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1d284d),
        ),
        backgroundColor: Color(0xFF1d284d),
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Tasks",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: "Montserrat-SemiBold",
                          letterSpacing: -1),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(190, 0, 0, 0),
                      child: RawMaterialButton(
                        shape: CircleBorder(),
                        fillColor: Color(0xFF071030),
                        elevation: 10,
                        child: Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.tealAccent[400],
                        ),
                        onPressed: () {
                          print(currentUser.tasks);

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
                                          "Create a task",
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
                                                setState(() {
                                                  newTask.created_at = date;

                                                  print(newTask.created_at);
                                                });
                                              });
                                            },
                                          ),
                                          Text("Date"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 15),
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
                                              _buildItemPicker();
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
                                          color: Colors.tealAccent[400],
                                          child: MaterialButton(
                                            minWidth: 200,
                                            padding: EdgeInsets.fromLTRB(
                                                40, 5, 40, 5),
                                            onPressed: () {
                                              setState(() {
                                                newTask.task = taskCtrl.text;
                                              });
                                              currentUser.tasks.add(newTask);
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
              Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: currentUser.tasks.length,
                    itemBuilder: (_, i) {
                      Task updatedTask = currentUser.tasks[i];
                      return Dismissible(
                        key: Key(UniqueKey().toString()),
                        onDismissed: (direction) {
                          currentUser.tasks.removeAt(i);
                          setState(() {});
                        },
                        background: Container(
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 5),
                          child: Card(
                            color: Color(0xFF071030),
                            child: InkWell(
                              onLongPress: () {
                               
                                // show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 20, 0, 15),
                                              child: Text(
                                                "Edit task",
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
                                            padding: EdgeInsets.fromLTRB(
                                                30, 20, 30, 10),
                                            child: Container(
                                              child: TextField(
                                                controller: updateTaskCtrl,
                                                decoration: InputDecoration(
                                                  hintText: 'Description',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
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
                                                    Icons.alarm,
                                                    color: Colors.purpleAccent,
                                                  ),
                                                  onPressed: () {
                                                    showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(2001),
                                                      lastDate: DateTime(2222),
                                                    ).then((date) {
                                                      setState(() {
                                                        newTask.created_at =
                                                            date;

                                                        print(
                                                            newTask.created_at);
                                                      });
                                                    });
                                                  },
                                                ),
                                                Text("Date"),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 0, 15, 15),
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
                                                    _buildItemPicker();
                                                  },
                                                ),
                                                Text("Priority"),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 40),
                                              child: Material(
                                                elevation: 5.0,
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                color: Colors.tealAccent[400],
                                                child: MaterialButton(
                                                  minWidth: 200,
                                                  padding: EdgeInsets.fromLTRB(
                                                      40, 5, 40, 5),
                                                  onPressed: () {
                                                    setState(() {
                                                      updatedTask.task =
                                                          updateTaskCtrl.text;
                                                    });
                                                    currentUser.tasks[i] =
                                                        updatedTask.task
                                                            as Task;
                                                  },
                                                  child: Text("Update",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                              fontFamily:
                                                                  'Montserrat',
                                                              fontSize: 20)
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                ),
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              child: CheckboxListTile(
                                checkColor: Color(0xFF071030),
                                activeColor: Colors.tealAccent[400],
                                title: !currentUser.tasks[i].completed
                                    ? Text(
                                        currentUser.tasks[i].task,
                                        style: TextStyle(
                                            color: Colors.grey[100],
                                            fontSize: 17),
                                      )
                                    : Text(
                                        currentUser.tasks[i].task,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 17,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      ),
                                value: currentUser.tasks[i].completed,
                                onChanged: (value) {
                                  currentUser.tasks[i].completed =
                                      !currentUser.tasks[i].completed;
                                  currentUser.tasks[i].completed == true
                                      ? currentUser.completed
                                          .add(currentUser.tasks[i])
                                      : currentUser.completed
                                          .remove(currentUser.tasks[i].task);
                                  print(currentUser.completed);
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
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
