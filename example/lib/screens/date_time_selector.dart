import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nixui/widgets/nixui.dart';

class DateTimeSelectorScreen extends StatefulWidget {
  const DateTimeSelectorScreen({super.key});

  @override
  State<DateTimeSelectorScreen> createState() => _DateTimeSelectorScreenState();
}

class _DateTimeSelectorScreenState extends State<DateTimeSelectorScreen> {

  var startDate = DateTime.now().add(Duration(days: -7));
  var endDate = DateTime.now();
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NxTextFormField Widget"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          NxDateTimeSelector.dateRange(
            startDate: startDate,
            endDate: endDate,
            dateRangeChanged: (dateRange) => setState(() {
              startDate = dateRange.start;
              endDate = dateRange.end;
            }),
            child: NxBox(
              padding: EdgeInsets.all(16),
              color: Colors.blue[50],
              borderRadius: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NxText.small(
                    'CLICK THIS AREA TO CHANGE **RANGE DATE**',
                  ),
                  NxText.headline5(
                    'Start: ${DateFormat('dd MMMM y').format(startDate)}',
                  ),
                  NxText.headline5(
                    'End: ${DateFormat('dd MMMM y').format(endDate)}',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          NxDateTimeSelector.date(
            initialDate: selectedDate,
            dateChanged: (date) => setState(() => selectedDate = date),
            child: NxBox(
              padding: EdgeInsets.all(16),
              color: Colors.blue[50],
              borderRadius: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NxText.small(
                    'CLICK THIS AREA TO CHANGE **DATE**',
                  ),
                  NxText.headline5(
                    DateFormat('dd MMMM y').format(selectedDate),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          NxDateTimeSelector.time(
            initialTime: selectedTime,
            timeChanged: (time) => setState(() => selectedTime = time),
            child: NxBox(
              padding: EdgeInsets.all(16),
              color: Colors.blue[50],
              borderRadius: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NxText.small(
                    'CLICK THIS AREA TO CHANGE **TIME**',
                  ),
                  NxText.headline5(
                    '${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name}',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}