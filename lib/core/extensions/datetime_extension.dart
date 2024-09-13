import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format({String dateFormat = 'dd MMMM yyyy'}) =>
      DateFormat(dateFormat).format(this);

  String humanize({String dateFormat = 'dd MMMM yyyy'}) {
    Duration diffrence = DateTime.now().difference(this);
    // print(
    //     'date : $this , diffrence in days: ${diffrence.inDays},diffrence in hours: ${diffrence.inHours},diffrence in minutes: ${diffrence.inMinutes}');
    switch (diffrence.inDays) {
      case 0:
        return "Aujourd'hui";
      case 1:
        return "Hier";
      default:
        return format(dateFormat: dateFormat);
    }
  }

  DateTime toDate() =>
      copyWith(hour: 0, second: 0, minute: 0, millisecond: 0, microsecond: 0);
}
