import 'package:productivist/models/task.dart';
import 'package:productivist/models/reminder.dart';
import 'package:productivist/models/event.dart';
import 'package:productivist/models/project.dart';

class User {
  int id;
  String name;
  String email;
  String password;
  List<Task> tasks;
  List<Reminder> reminders;
  List<Event> events;
  List<Project> projects;
  List<Task> completed;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.tasks,
    this.reminders,
    this.events,
    this.projects,
    this.completed,
  });
}

List<Task> myTasks = [
  Task(
    id: 0,
    task: "Study for finals",
    created_at: DateTime.now(),
    priority: 1,
  ),
  Task(
    id: 1,
    task: "Wash your clothes",
    created_at: DateTime.now(),
    priority: 1,
  ),
  Task(
    id: 2,
    task: "Make some food",
    created_at: DateTime.now(),
    priority: 1,
  ),
  Task(
    id: 3,
    task: "Go car shopping",
    created_at: DateTime.now(),
    priority: 1,
  ),
];

List<Event> myEvents = [
  Event(
    id: 0,
    title: "Bobs birthday party",
    location: "1800 Norma Dr",
    date: DateTime.now(),
    time: DateTime.now(),
    completed: false,
  ),
];

List<Reminder> myReminders = [
  Reminder(
    id: 0,
    text: "SWE2 Final Exam",
    remind_at: DateTime.now(),
  ),
  Reminder(
    id: 1,
    text: "HW Due",
    remind_at: DateTime.now(),
  ),
  Reminder(
    id: 2,
    text: "Do laundry",
    remind_at: DateTime.now(),
  )
];

List<Project> myProjects = [
  Project(
      id: 0,
      title: "iOS App",
      description: "Productivity App",
      dueDate: DateTime.now()),
];

List<Task> completedTasks = [];

final User currentUser = User(
  id: 0,
  name: "Josh",
  email: "josh@gmail.com",
  password: "password",
  tasks: myTasks,
  events: myEvents,
  reminders: myReminders,
  projects: myProjects,
  completed: completedTasks,
);
