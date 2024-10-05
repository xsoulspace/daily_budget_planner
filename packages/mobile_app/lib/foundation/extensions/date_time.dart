import 'package:intl/intl.dart';

DateTime dateTimeNowUtc() => DateTime.now().toUtc();

DateTime? dateTimeFromMilisecondsSinceEpoch(final int? millisecondsSinceEpoch) {
  if (millisecondsSinceEpoch == null) return null;
  return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
}

int? dateTimeToMilisecondsSinceEpoch(final DateTime? dateTime) {
  if (dateTime == null) return null;
  return dateTime.millisecondsSinceEpoch;
}

extension DateTimeExtension on DateTime {
  String format({final String pattern = 'dd/MM/yyyy', final String? locale}) {
    if (locale != null && locale.isNotEmpty) {
      Intl.defaultLocale = 'en_EN';
    }
    return DateFormat(pattern, locale).format(this);
  }

  String formatDdMmYyyy() => toLocal().format(pattern: 'dd.MM.yyyy');
}
