class Reminder {
  int id;
  String text;
  DateTime remind_at;
  int priority;
  bool completed;

  Reminder({
    this.id,
    this.text,
    this.remind_at,
    this.priority,
    this.completed = false,
  });
}
