import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivist/models/user.dart';
import 'package:productivist/models/task.dart';
import 'package:productivist/models/event.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  TextEditingController eventCtrl = TextEditingController();
  TextEditingController updateEventCtrl = TextEditingController();
  Event newEvent = Event();
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
                      "Events",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontFamily: "Montserrat-SemiBold",
                          letterSpacing: -1),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(165, 0, 0, 0),
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
                          print(currentUser.events);

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
                                          "Create an event",
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
                                          controller: eventCtrl,
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
                                                  newEvent.date = date;

                                                  print(newEvent.date);
                                                });
                                              });
                                            },
                                          ),
                                          Text("Date"),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(15,0,15,15),
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
                                                newEvent.title = eventCtrl.text;
                                              });
                                              currentUser.events.add(newEvent);
                                              print(newEvent.title);
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
                    itemCount: currentUser.events.length,
                    itemBuilder: (_, i) {
                      Event updatedEvent = currentUser.events[i];
                      return Dismissible(
                        key: Key(UniqueKey().toString()),
                        onDismissed: (direction) {
                          currentUser.events.removeAt(i);
                          setState(() {});
                        },
                        background: Container(
                          color: Colors.red,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
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
                                                "Edit event",
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
                                                controller: updateEventCtrl,
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
                                                        newEvent.date =
                                                            date;

                                                        print(
                                                            newEvent.date);
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
                                                    //_buildItemPicker();
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
                                                      updatedEvent.title =
                                                          updateEventCtrl.text;
                                                    });
                                                    currentUser.events[i] =
                                                        updatedEvent.title as Event;
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
                          title: !currentUser.events[i].completed
                              ? Text(
                                  currentUser.events[i].title,
                                  style: TextStyle(color: Colors.grey[100]),
                                )
                              : Text(
                                  currentUser.events[i].title,
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 17,
                                      decoration: TextDecoration.lineThrough),
                                ),
                          value: currentUser.events[i].completed,
                          onChanged: (value) {
                            currentUser.events[i].completed =
                                !currentUser.events[i].completed;
                            //Make a list of completed events for this to work
                            // currentUser.events[i].completed == true
                            //     ? currentUser.completed
                            //         .add(currentUser.events[i])
                            //     : currentUser.completed
                            //         .remove(currentUser.events[i].task);

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
