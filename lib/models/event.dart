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
}
