import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static final dateFormat = DateFormat('dd MMMM');
  static final dateFormat2 = DateFormat('dd MMMM yyyy');
  static final yyyymmdd = DateFormat('yyyy-MM-dd');
  static final ddmmyyyy2 = DateFormat('yyyy-MM-dd');
}
