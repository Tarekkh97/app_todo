class TaskModel {
  String title;
  String date;
  String note;
  String starttime;
  String endtime;
  String remind;
  String repeat;
  int color;
  int iscomplet;

  TaskModel({
    required this.title,
    required this.note,
    required this.date,
    required this.starttime,
    required this.endtime,
    required this.remind,
    required this.repeat,
    required this.color,
    required this.iscomplet,
  });
}
