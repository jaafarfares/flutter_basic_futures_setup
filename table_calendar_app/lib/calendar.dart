import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalendarController calendarController = Get.put(CalendarController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
              const SizedBox(height: 30),
              EventsListWithTimeline(),
            ],
          ),
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
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 99,
          child: Stack(
            children: [
              Column(
                children: List.generate(
                  11,
                  (index) {
                    final hour = 8 + index;
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60,
                          alignment: Alignment.topCenter,
                          padding: const EdgeInsets.only(right: 10),
                          child: Text('${hour.toString().padLeft(2, '0')}:00'),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: CustomPaint(
                  painter: TimelinePainter(topPadding: 11),
                ),
              ),
            ],
          ),
        ),
        // Events List
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 11),
            height: 550,
            child: Obx(
              () {
                final events = calendarController
                    .getEventsForDay(calendarController.today.value);

                final currentTime = DateTime.now();

                return Stack(
                  children: events.map((event) {
                    final startTimeParts = event.startTime.split(':');
                    final endTimeParts = event.endTime.split(':');

                    final startHour = int.parse(startTimeParts[0]);
                    final startMinute = int.parse(startTimeParts[1]);
                    final endHour = int.parse(endTimeParts[0]);
                    final endMinute = int.parse(endTimeParts[1]);

                    final eventStartTime =
                        DateTime(currentTime.year, currentTime.month,
                            currentTime.day, startHour, startMinute);
                    final eventEndTime =
                        DateTime(currentTime.year, currentTime.month,
                            currentTime.day, endHour, endMinute);

                    Color eventColor = Colors.orange; 

                    // Determine event color based on timing
                    if (currentTime.isAfter(eventEndTime)) {
                      // Event has already ended
                      eventColor = Colors.green;
                    }  else if (currentTime.isBefore(eventStartTime)) {
  // Calculate the difference in minutes between currentTime and eventStartTime
  final differenceInMinutes = eventStartTime.difference(currentTime).inMinutes;

  // Check if the difference is less than 60 minutes
  if (differenceInMinutes <= 60) {
    eventColor = Colors.red;
  }
} else if (currentTime.isAfter(eventStartTime) &&
                        currentTime.isBefore(eventEndTime)) {
                      // Event is ongoing
                      eventColor = Colors.red;
                    }

                    final topPosition =
                        ((startHour - 8) * 60) + startMinute.toDouble();
                    final eventHeight =
                        ((endHour - startHour) * 60) + (endMinute - startMinute)
                            .toDouble();

                    return Positioned(
                      top: topPosition,
                      left: 0,
                      right: 0,
                      height: eventHeight,
                      child: Container(
                        margin: const EdgeInsets.only(left: 17),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: eventColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Row(children: [ Text(
                              event.title,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              event.className,
                              style: const TextStyle(color: Colors.white),
                            ),],),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  event.room,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Spacer(),
                                Text(
                                  '${event.startTime} - ${event.endTime}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class TimelinePainter extends CustomPainter {
  final double topPadding;

  TimelinePainter({this.topPadding = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2;

    final redDotPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final padding = 11.0;
    final startY = topPadding;
    final endY = size.height - 50;
    final lineX = size.width / 2 + padding;

    // Draw vertical line
    canvas.drawLine(Offset(lineX, startY), Offset(lineX, endY), paint);

    // Draw circles/knots for each hour
    for (int i = 0; i <= 10; i++) {
      final knotY = (i * 60).toDouble() + topPadding;
      canvas.drawCircle(Offset(lineX, knotY), 4, paint);
    }

    // Calculate current time position
    final currentTime = DateTime.now();
    final currentHour = currentTime.hour;
    final currentMinute = currentTime.minute;
    final currentTopPosition =
        ((currentHour - 8) * 60 + currentMinute).toDouble() + topPadding;

    // Draw red dot at the current time position
    canvas.drawCircle(Offset(lineX, currentTopPosition), 5, redDotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CalendarController extends GetxController {
  var today = DateTime.now().obs;
  var events = <DateTime, List<Event>>{}.obs;
  var selectedItemPosition = 2.obs;

  @override
  void onInit() {
    super.onInit();
    events[DateTime(2024, 7, 18)] = [
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
        Event(
        title: 'History Class',
        startTime: '12:00',
        endTime: '13:00',
        className: 'math-101',
        room: 'room 5',
      ),
        Event(
        title: 'sience Class',
        startTime: '14:00',
        endTime: '15:00',
        className: 'math-101',
        room: 'room 5',
      ),
    ];
    events[DateTime(2024, 7, 19)] = [
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
