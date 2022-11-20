import 'package:flutter/material.dart';
import 'package:nixui/themes/theme.dart';

enum DateTimeSelection { date, time, dateRange }

class _NxDateTimeSelectorBasic extends StatelessWidget {

  final Widget child;
  final DateTimeSelection dateTimeSelection;
  final DateTime? initialDate;
  final Function(DateTime)? dateChanged;
  final DateTime? startDate;
  final DateTime? endDate;
  final Function(DateTimeRange)? dateRangeChanged;
  final TimeOfDay? initialTime;
  final Function(TimeOfDay)? timeChanged;
  final bool? alwaysUse24HourFormat;

  const _NxDateTimeSelectorBasic({
    Key? key,
    required this.dateTimeSelection,
    required this.child,
    this.initialDate,
    this.dateChanged,
    this.startDate,
    this.endDate,
    this.dateRangeChanged,
    this.initialTime,
    this.timeChanged,
    this.alwaysUse24HourFormat,
  }) : super(key: key);

  Future<DateTimeRange?> _getDateRange(BuildContext context) async{

    var startDate = this.startDate ?? DateTime.now();
    var endDate = this.endDate ?? DateTime.now();
    
    final picker = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(start: startDate, end: endDate),
      firstDate: DateTime(1950),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: NxColor.primary)
          ),
          child: child!,
        );
      }
    );

    return picker;
  }

  Future<DateTime?> _getDate(BuildContext context) async{
    final picker = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: NxColor.primary)
          ),
          child: child!,
        );
      }
    );

    return picker;
  }

  Future<TimeOfDay?> _getTime(BuildContext context) async {
    final picker = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: NxColor.primary)
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              alwaysUse24HourFormat: alwaysUse24HourFormat
            ),
            child: child!
          ),
        );
      }
    );

    return picker;
  }

  @override
  Widget build(BuildContext context) { 
    return InkWell(
      onTap: () async {
        switch (dateTimeSelection) {
          
          case DateTimeSelection.dateRange:
            var dateRange = await _getDateRange(context);
            if (dateRange != null) {
              dateRangeChanged?.call(dateRange);
            }
            break;

          case DateTimeSelection.date:
            var date = await _getDate(context);
            if (date != null) {
              dateChanged?.call(date);
            }
            break;

          case DateTimeSelection.time:
            var time = await _getTime(context);
            if (time != null) {
              timeChanged?.call(time);
            }
            break;

          default:

        }
      },
      child: child,
    );
  }
}

class NxDateTimeSelector extends _NxDateTimeSelectorBasic {

  const NxDateTimeSelector.dateRange({
    super.key,
    super.startDate,
    super.endDate,
    super.dateRangeChanged,
    required super.child
  }) : super(
    dateTimeSelection: DateTimeSelection.dateRange
  );

  const NxDateTimeSelector.date({
    super.key,
    super.initialDate,
    super.dateChanged,
    required super.child
  }) : super(
    dateTimeSelection: DateTimeSelection.date
  );
  
  const NxDateTimeSelector.time({
    super.key,
    super.initialTime,
    super.timeChanged,
    super.alwaysUse24HourFormat,
    required super.child
  }) : super(
    dateTimeSelection: DateTimeSelection.time
  );

}