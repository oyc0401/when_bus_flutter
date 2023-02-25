import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeFormat {

  static late SharedPreferences prefs;

  static late  bool _isFull;

  static bool get isFull => _isFull;

  static void setFull(bool b) {
    _isFull = b;
    prefs.setBool("full_time", b);
  }

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    _isFull = prefs.getBool("full_time") ?? true;
  }

  static String getTimeKor(String date) {
    DateTime dateTime = DateTime.parse(date);

    if (_isFull) {
      return DateFormat('HH시 mm분').format(dateTime);
    } else {
      if (dateTime.hour < 12) {
        return DateFormat('오전 hh:mm').format(dateTime);
      } else {
        return DateFormat('오후 hh:mm').format(dateTime);
      }
    }
  }

}
