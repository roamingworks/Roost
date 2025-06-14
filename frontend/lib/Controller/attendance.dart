import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class AttendanceController{
  static const String key = "";

  // Check if Attendance Today
  Future<bool> isAttendanceToday() async {
    final prefs = await SharedPreferences.getInstance();
    final lastDate = prefs.getString(key);
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return today == lastDate;
  }

  // Save today Attendance
  Future<void> saveAttendance() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    await prefs.setString(key, today);
  }
}