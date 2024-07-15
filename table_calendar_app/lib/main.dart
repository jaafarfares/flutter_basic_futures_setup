import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController = Get.put(CalendarController());
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/shcoll_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Obx(
              () => TableCalendar(
                rangeSelectionMode: RangeSelectionMode.toggledOn,
                daysOfWeekHeight: 50,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  markersMaxCount: 1,
                  markersAlignment: Alignment.bottomRight,
                  markerMargin:
                      const EdgeInsets.only(top: 6, right: 20, left: 20),
                  markerDecoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  cellMargin: const EdgeInsets.all(2),
                  cellPadding: const EdgeInsets.all(1),
                  cellAlignment: Alignment.center,
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  defaultDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  weekendDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  holidayDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  outsideDecoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  rangeStartDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  rangeEndDecoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  rangeHighlightColor: Colors.red,
                  todayDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    shape: BoxShape.rectangle,
                    color: Colors.blue.withOpacity(0.2),
                  ),
                  selectedTextStyle: const TextStyle(color: Colors.white),
                  todayTextStyle: const TextStyle(color: Colors.black),
                ),
                startingDayOfWeek: StartingDayOfWeek.monday,
                /*  enabledDayPredicate: (DateTime day) {
                  return day.weekday != 7;
                }, */
                daysOfWeekVisible: false,
                firstDay: DateTime.utc(2021, 1, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: calendarController.today.value,
                selectedDayPredicate: (DateTime day) {
                  return isSameDay(calendarController.today.value, day);
                },
                rowHeight: 90,
                calendarFormat: CalendarFormat.week,
                onDaySelected: calendarController.onDaySelected,
                availableGestures: AvailableGestures.horizontalSwipe,
                eventLoader: (DateTime day) {
                  return calendarController.getEventsForDay(day);
                },
                calendarBuilders: CalendarBuilders(
                  rangeEndBuilder: (context, day, focusedDay) {
                    return Container(
                      height: 90,
                      width: 120,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${day.day}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat.E().format(day),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  weekNumberBuilder: (context, weekNumber) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          'Week $weekNumber',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Container(
                      height: 90,
                      width: 120,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${day.day}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat.E().format(day),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return Container(
                      height: 90,
                      width: 120,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue.withOpacity(0.2),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${day.day}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat.E().format(day),
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  defaultBuilder: (context, date, focusedDay) {
                    final isToday =
                        isSameDay(calendarController.today.value, date);
                    final isSelectedDay =
                        isSameDay(calendarController.today.value, date);

                    return Container(
                      height: 90,
                      width: 120,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: isSelectedDay ? Colors.blue : Colors.white70,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${date.day}',
                            style: TextStyle(
                              color: isToday && !isSelectedDay
                                  ? Colors.red
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            DateFormat.E().format(date),
                            style: TextStyle(
                              color: isToday && !isSelectedDay
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
             EventsListWithTimeline(),
            /* Obx(
              () {
                final events = calendarController
                    .getEventsForDay(calendarController.today.value);
                return Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(12),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),

                          /*   border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ), */
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "CPI ANetworking",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text("time "),
                                Text("08:00      09:00"),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text("class "),
                                Text("ptc-2"),
                                Spacer(),
                                Text("room 23",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold, color:  Colors.black54),
                            ),
                                SizedBox(width: 10),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ), */
          ],
        ),
      ),
    );
  }
}
class EventsListWithTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calendarController = Get.put(CalendarController());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline (Vertical Line)
        Container(
          width: 60,
          child: Column(
            children: List.generate(
              9, // Number of hours from 8:00 to 16:00
              (index) {
                final hour = 8 + index;
                return Container(
                  height: 60,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 10),
                  child: Text('${hour.toString().padLeft(2, '0')}:00'),
                );
              },
            ),
          ),
        ),
        // Events List
        Expanded(
          child: Container(
            height: 300,
            child: Obx(
              () {
                final events = calendarController
                    .getEventsForDay(calendarController.today.value);

                return ListView(
                  children: List.generate(9, (index) {
                    final hour = 8 + index;
                    final hourEvents = events.where((event) {
                      final eventStartHour = int.parse(event.startTime.split(':')[0]);
                      return eventStartHour == hour;
                    }).toList();
                
                    return Container(
                      height: 60,
                      child: Column(
                        children: hourEvents.map((event) {
                          return Container(
                            margin: EdgeInsets.only(left: 8),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              event.title,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}


class CalendarController extends GetxController {
  var today = DateTime.now().obs;
  var events = <DateTime, List<Event>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    // Example events
    events[DateTime(2024, 7, 16)] = [
      Event(
        title: 'CPI Networking',
        startTime: '08:00',
        endTime: '09:00',
        className: 'ptc-2',
        room: 'room 23',
      ),
      Event(
        title: 'Math Class',
        startTime: '10:00',
        endTime: '11:00',
        className: 'math-101',
        room: 'room 5',
      ),
    ];
    events[DateTime(2024, 7, 17)] = [
      Event(
        title: 'Physics Class',
        startTime: '09:00',
        endTime: '10:00',
        className: 'phy-201',
        room: 'room 7',
      ),
      Event(
        title: 'Chemistry Lab',
        startTime: '13:00',
        endTime: '14:00',
        className: 'chem-301',
        room: 'lab 1',
      ),
    ];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    today.value = selectedDay;
  }

  List<Event> getEventsForDay(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }
}

class Event {
  final String title;
  final String startTime;
  final String endTime;
  final String className;
  final String room;

  Event({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.className,
    required this.room,
  });
}
/* class CalendarController extends GetxController {
  var today = DateTime.now().obs;
  var events = <DateTime, List<String>>{}.obs;

  @override
  void onInit() {
    super.onInit();

    events[DateTime(2024, 7, 16)] = [
      'Event 1 at 9:00 AM',
      'Event 2 at 1:00 PM'
    ];
    events[DateTime(2024, 7, 17)] = [
      'Event 3 at 10:00 AM',
      'Event 4 at 3:00 PM'
    ];
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    today.value = selectedDay;
  }

  List<String> getEventsForDay(DateTime day) {
    return events[DateTime(day.year, day.month, day.day)] ?? [];
  }
}
 */