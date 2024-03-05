import 'package:hive/hive.dart';
@HiveType(typeId: 0)
class NoteModel{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  NoteModel({required this.title,required this.description});
}