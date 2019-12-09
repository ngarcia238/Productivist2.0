class Event {
  int id;
  String title;
  String location;
  DateTime date;
  DateTime time;
  bool completed;

  Event({
    this.id,
    this.title,
    this.location,
    this.date,
    this.time,
    this.completed = false,
  });

  factory Event.fromJson(Map<String, dynamic>json){
    return Event(
      id: json["id"],
      title: json["title"],
      location: json["location"],
      completed: json["completed"],
      date: json["date"],
      time: json["time"],
      );
  }
}
