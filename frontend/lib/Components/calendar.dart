import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:frontend/Constants/colors.dart';

class Calendar {
  static Widget customCalendarWidget({
    required BuildContext context,
    DateTime? selectedDay,
    DateTime? focusedDay,
    Function(DateTime, DateTime)? onDaySelected,
  }) {
    return TableCalendar<Event>(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay ?? DateTime.now(),
      selectedDayPredicate: (day) {
        return selectedDay != null && isSameDay(selectedDay, day);
      },
      headerVisible: false,
      onDaySelected: (selected, focused) {
        if (onDaySelected != null) {
          onDaySelected(selected, focused);
        }

        // Show dialog with selected date
        showDialog(
          context: context,
          builder: (BuildContext context) {
            final formattedDate = DateFormat('d MMMM, y').format(selected);
            return Dialog(
              elevation: 10,
              shadowColor: Colors.black,
              child: SizedBox(
                width: 350,   // Set your desired width
                height: 350,  // Set your desired height
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    title: Text(formattedDate),
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close, color: ColorTheme.appTertiary),
                    ),
                  ),
                  body: Center(child: Text('Content...')),
                ),
              ),
            );
          },
        );
      },
      calendarStyle: CalendarStyle(
        defaultTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        defaultDecoration: BoxDecoration(
          color: ColorTheme.appTertiary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorTheme.appTertiary,
            width: 1,
          ),
        ),
        weekendTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        weekendDecoration: BoxDecoration(
          color: ColorTheme.appTertiary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorTheme.appTertiary,
            width: 1,
          ),
        ),
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        selectedDecoration: BoxDecoration(
          color: ColorTheme.appTertiary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorTheme.appTertiary, width: 1),
        ),
        todayTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        todayDecoration: BoxDecoration(
          color: ColorTheme.appTertiary,
          borderRadius: BorderRadius.circular(8),
        ),
        cellMargin: EdgeInsets.all(4),
        cellPadding: EdgeInsets.all(8),
      ),
    );
  }
}

class Event {
  final String title;
  Event(this.title);
}
