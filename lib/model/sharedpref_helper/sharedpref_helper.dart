// ignore_for_file: camel_case_types

import 'package:shared_preferences/shared_preferences.dart';

class sharedpref_helper {
  static late SharedPreferences sharedpre;

  init() async {
    sharedpre = await SharedPreferences.getInstance();
  }

  // String? getdatastring({
  //   required String key,
  // }) {
  //   return sharedpre.getString(key);
  // }

 Future<bool> savedata(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedpre.setBool(key, value);
    }
    if (value is String) {
      return await sharedpre.setString(key, value);
    }
    if (value is int) {
      return await sharedpre.setInt(key, value);
    } else {
      return await sharedpre.setDouble(key, value);
    }
  }

 dynamic getdata({required String key}) {
    return sharedpre.get(key);
  }
}
//get_it for not static because insert object for any data in file for app