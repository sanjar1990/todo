import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

var uuid = Uuid();
@HiveType(typeId: 0)
class TodoModel extends HiveObject{
  @HiveField(0)
  final String id=uuid.v4();
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime pickedDate;
  @HiveField(4)
  final String timeOfDay;
  TodoModel({required this.title, required this.description, required this.pickedDate, required this.timeOfDay});
  String timeOfDayToString(TimeOfDay time) => '${time.hour}:${time.minute}';
  TimeOfDay stringToTimeOfDay(String time) {
    final parts = time.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}