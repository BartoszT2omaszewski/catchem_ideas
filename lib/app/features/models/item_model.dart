import 'package:intl/intl.dart';

class ItemModel {
  ItemModel({
    required this.id,
    required this.title,
    required this.ideaDate,
  });

  final String id;
  final String title;
  final DateTime ideaDate;

  String daysLeft() {
    return ideaDate.difference(DateTime.now()).inDays.toString();
  }

  String ideaDateFormatted() {
    return DateFormat.yMMMEd().format(ideaDate);
  }
}
