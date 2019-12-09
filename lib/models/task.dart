class Task {
  int id;
  String task;
  DateTime created_at;
  bool completed;
  int priority;
  String category;

  Task({
    this.id,
    this.task,
    this.created_at,
    this.completed = false,
    this.priority,
    this.category,
  });
}
