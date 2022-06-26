import 'package:catchem_ideas/app/features/models/article_model.dart';
import 'package:catchem_ideas/data/remote_data_sources/articles_remote_data_source.dart';

class ArticlesRepository {
  ArticlesRepository({required this.remoteDataSource});

  final ArticlesRemoteRetrofitDataSource remoteDataSource;

  Future<List<ArticleModel>> getArticlesForAuthorId(int authorId) async {
    final allArticles = await remoteDataSource.getArticles();

    return allArticles
        .where((article) => article.authorId == authorId)
        .toList();
  }
}
