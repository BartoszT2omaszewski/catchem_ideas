import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'item_model.g.dart';
part 'item_model.freezed.dart';

@freezed
class ItemModel with _$ItemModel {
  ItemModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory ItemModel(
      {required String id,
      required String title,
      required DateTime ideaDate}) = _ItemModel;

  String daysLeft() {
    return ideaDate.difference(DateTime.now()).inDays.toString();
  }

  String ideaDateFormatted() {
    return DateFormat.yMMMEd().format(ideaDate);
  }
}
