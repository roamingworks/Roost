import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/meal.dart';


class MealController {
    List<MealModel> mealsHistory = [];

    Future<void> loadHistoryMeals() async {
        final prefs = await SharedPreferences.getInstance();
        final data = prefs.getStringList('meals') ?? [];

        mealsHistory = data.map((e) => MealModel.fromJson(jsonDecode(e))).toList();
        clearOldEntries();
    }

    Future<void> saveTodayMeals(int count) async {
        final prefs = await SharedPreferences.getInstance();
        final todayDay = MealModel.getCurrentDayAbbreviation();

        mealsHistory.removeWhere((item) => item.day == todayDay);
        mealsHistory.add(MealModel(count: count, day: todayDay));

        final data = mealsHistory.map((e) => jsonEncode(e.toJson())).toList();
        await prefs.setStringList('meals', data);
    }

    void clearOldEntries() {
    // Only keep last 7 days based on list length since we're storing by weekday
        if (mealsHistory.length > 7) {
            mealsHistory = mealsHistory.sublist(mealsHistory.length - 7);
        }
    }

    int getTodayMeals() { 
        final todayDay = MealModel.getCurrentDayAbbreviation();
        final todayEntry =mealsHistory.firstWhere(
            (e) => e.day == todayDay,
            orElse: () => MealModel(count: 0, day: todayDay));
        return todayEntry.count;
    }

    String getFormattedToday() {
        return MealModel.getCurrentDayAbbreviation();
    }
}