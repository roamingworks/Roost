import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/Models/attendance.dart';

class AttendanceController {
  bool isHostel = false;
  List<AttendanceModel> attendanceHistory = [];
  DateTime? lastAttendanceDate;

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load Attendance state
    isHostel = prefs.getBool('isHostel') ?? false;

    // Load Attendance history
    final historyJson = prefs.getString('AttendanceHistory');
    if (historyJson != null) {
      final decoded = json.decode(historyJson) as List;
      attendanceHistory =
          decoded.map((item) => AttendanceModel.fromJson(item)).toList();
    }

    // Load last updated date
    final lastDateStr = prefs.getString('lastAttendanceDate');
    if (lastDateStr != null) {
      lastAttendanceDate = DateTime.tryParse(lastDateStr);
    }

    // Check if it's a new day → reset state to OFF
    final now = DateTime.now();
    if (lastAttendanceDate == null ||
        lastAttendanceDate!.day != now.day ||
        lastAttendanceDate!.month != now.month ||
        lastAttendanceDate!.year != now.year) {
      isHostel = false;
      final newEntry = AttendanceModel(state: "OFF", timestamp: now.toIso8601String());
      attendanceHistory.add(newEntry);
      await prefs.setBool('isHostel', isHostel);
      await prefs.setString('lastAttendanceDate', now.toIso8601String());
      await saveHistory(prefs);
    }

    await sendOldAttendanceToBackend();
  }

  Future<void> AttendanceState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isHostel = !isHostel;

    final now = DateTime.now();
    lastAttendanceDate = now;

    await prefs.setBool('isHostel', isHostel);
    await prefs.setString('lastAttendanceDate', now.toIso8601String());

    final newEntry = AttendanceModel(
      state: isHostel ? "ON" : "OFF",
      timestamp: now.toIso8601String(),
    );

    attendanceHistory.add(newEntry);
    await saveHistory(prefs);
  }

  Future<void> saveHistory(SharedPreferences prefs) async {
    final historyJson =
        json.encode(attendanceHistory.map((e) => e.toJson()).toList());
    await prefs.setString('attendanceHistory', historyJson);
  }

  Future<void> sendOldAttendanceToBackend() async {
    final now = DateTime.now();
    List<AttendanceModel> newList = [];

    for (var entry in attendanceHistory) {
      final timestamp = DateTime.parse(entry.timestamp);
      if (now.difference(timestamp).inDays >= 7) {
        await http.post(
          Uri.parse('http://localhost:5000/api/store-attendance'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(entry.toJson()),
        );
      } else {
        newList.add(entry);
      }
    }

    attendanceHistory = newList;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await saveHistory(prefs);
  }
}
