part of 'articles_cubit.dart';

class ArticlesState {
  ArticlesState({
    this.results = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<ArticleModel> results;
  final Status status;
  final String? errorMessage;
}
