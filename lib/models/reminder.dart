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

  factory Reminder.fromJson(Map<String, dynamic>json){
    return Reminder(
      id: json["id"],
      text: json["text"],
      remind_at: json["remind_at"],
      priority: json["priority"],
      completed: json["completed"],
      );
  }
}
