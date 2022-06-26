import 'package:catchem_ideas/app/core/enums.dart';
import 'package:catchem_ideas/app/features/models/article_model.dart';
import 'package:catchem_ideas/app/features/repositories/articles_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'articles_state.dart';

@injectable
class ArticlesCubit extends Cubit<ArticlesState> {
  ArticlesCubit({required this.articlesRepository}) : super(ArticlesState());

  final ArticlesRepository articlesRepository;

  Future<void> fetchData({required int authorId}) async {
    emit(
      ArticlesState(
        status: Status.loading,
      ),
    );
    try {
      final results = await articlesRepository.getArticlesForAuthorId(authorId);
      emit(
        ArticlesState(
          status: Status.success,
          results: results,
        ),
      );
    } catch (error) {
      emit(
        ArticlesState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
