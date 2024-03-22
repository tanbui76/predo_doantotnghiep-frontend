import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as time_ago;

import '../../resources/export/core_export.dart';
import '../../services/share_preference._helper.dart';

///
/// Format datetime
///
mixin AppDate {
  static String formatDate(DateTime dateTime, {String format = "dd/MM/yyyy"}) {
    /// yyyy-MM-dd hh:mm:ss
    /// HH:mm dd-MM-yyyy
    /// dd MMM yyyy
    /// dd-MM-yyyy
    /// dd/MM/yyyy
    /// hh:mm
    /// yyyy-MM-dd
    return DateFormat(format, sl<SharedPreferenceHelper>().getLocale).format(dateTime);
  }

  static DateTime parseDateTime(String dateTime, {String format = "dd/MM/yyyy"}) {
    if (!AppValidate.nullOrEmpty(dateTime)) {
      return DateFormat(format).parse(dateTime);
    }
    return DateTime(1970);
  }

  ///
  /// Customer display time ago.
  ///
  static String customerDisplayTime(DateTime date, {String format = 'HH:mm dd-MM-yyyy'}) {
    //
    // Convert to dd-MM-yyyy.
    final String _passDate = DateFormat('dd-MM-yyyy').format(date);
    final DateTime _convertPassDate = DateFormat('dd-MM-yyyy').parse(_passDate);
    final DateTime _now = DateTime.now();

    if (_now.difference(_convertPassDate).inDays > 0) {
      return DateFormat(sl<SharedPreferenceHelper>().getLocale == 'en' ? format : 'MMM d, y h:mm a').format(date);
    }

    return time_ago.format(date, locale: sl<SharedPreferenceHelper>().getLocale);
  }

  ///
  /// Calculate age.
  ///
  static int calculateAge(DateTime birthDate) {
    final DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  ///
  /// Custom time ago.
  ///
  static String timeAgoCustom(DateTime dateTime, {bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(dateTime);

    if ((difference.inDays / 7).floor() >= 1) {
      return numericDates ? '1 tuần' : '1 week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} ngày';
    } else if (difference.inDays >= 1) {
      return numericDates ? '1 ngày' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} giờ';
    } else if (difference.inHours >= 1) {
      return numericDates ? '1 giờ' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes}p';
    } else if (difference.inMinutes >= 1) {
      return numericDates ? '1p' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds}s';
    } else {
      return 'Bây giờ';
    }
  }

  static String? formatDateHaveTodayString({
    required DateTime createAtBefore,
    required DateTime createAtNow,
    required bool isShowOnFirst,
  }) {
    String? _result;

    if (isShowOnFirst) {
      _result = DateFormat('yMd', sl<SharedPreferenceHelper>().getLocale).add_jm().format(createAtNow);

      // If today.
      if (DateTime.now().compareTo(DateTime.now()) == 0) {
        _result = _result.replaceAll(_result.split(' ').first, 'Today');
      }
      return _result;
    }

    if (createAtNow.difference(createAtBefore).inMinutes >= 30) {
      _result = DateFormat('yMd', sl<SharedPreferenceHelper>().getLocale).add_jm().format(createAtNow);

      // If today.
      if (DateTime.now().compareTo(DateTime.now()) == 0) {
        _result = _result.replaceAll(_result.split(' ').first, 'Today');
      }
      return _result;
    }

    return _result;
  }
}
