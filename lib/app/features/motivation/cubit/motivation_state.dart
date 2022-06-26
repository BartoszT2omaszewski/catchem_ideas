part of 'motivation_cubit.dart';

class MotivationState {
  MotivationState({
    this.results = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<AuthorModel> results;
  final Status status;
  final String? errorMessage;
}
