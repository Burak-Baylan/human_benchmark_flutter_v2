import 'package:intl/intl.dart';

class DateHelper {
  static String get getDateStr =>
      DateFormat('hh:mm:ss  dd.M.yyyy').format(DateTime.now());
}
