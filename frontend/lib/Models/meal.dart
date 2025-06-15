import 'package:intl/intl.dart';

class MealModel {
  static Map<String, bool> mealStatus = {
    'breakfast': false,
    'lunch': false,
    'teaSnacks': false,
    'dinner': false,
  };

  static int? mealCount;
  int count;
  String day;

  MealModel({ required this.count, required this.day });

  Map<String, dynamic> toJson() {
    return {
        'count': count,
        'date': day,
    };
  }

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
        count: json['count'],
        day: json['date']
    );
  }

  static String getCurrentDayAbbreviation() {
    return DateFormat('EEE').format(DateTime.now()); // e.g., 'Mon'
  }
}