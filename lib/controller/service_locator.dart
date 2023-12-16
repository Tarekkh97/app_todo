import 'package:get_it/get_it.dart';
import 'package:todo_app/controller/notificationservice.dart';
import 'package:todo_app/model/Spflite_helper/sqflite_helper.dart';
import 'package:todo_app/model/sharedpref_helper/sharedpref_helper.dart';

GetIt sl = GetIt.instance;

Future<void> setup() async {
  sl.registerLazySingleton<SqlDb>(() => SqlDb());
  sl.registerLazySingleton<sharedpref_helper>(() => sharedpref_helper());
  sl.registerLazySingleton<NotificationService>(() => NotificationService());

}
