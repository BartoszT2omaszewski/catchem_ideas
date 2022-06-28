import 'package:catchem_ideas/app/features/models/article_model.dart';
import 'package:catchem_ideas/app/features/repositories/articles_repository.dart';
import 'package:catchem_ideas/data/remote_data_sources/articles_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockArticlesDataSource extends Mock
    implements ArticlesRemoteRetrofitDataSource {}

void main() {
  late ArticlesRepository sut;
  late MockArticlesDataSource dataSource;

  setUp(() {
    dataSource = MockArticlesDataSource();
    sut = ArticlesRepository(remoteDataSource: dataSource);
  });

  group('getArticlesForAuthorId', () {
    test('should call remoteDataSource.getArticles() method', () async {
      //1
      when(() => dataSource.getArticles()).thenAnswer((_) async => []);
      //2
      await sut.getArticlesForAuthorId(555);
      //3
      verify(() => dataSource.getArticles()).called(1);
    });

    test('should filter data source results with provided author id', () async {
      //1
      when(() => dataSource.getArticles()).thenAnswer((_) async => [
            ArticleModel(
              1,
              555,
              'content1',
            ),
            ArticleModel(
              2,
              333,
              'content2',
            ),
            ArticleModel(
              3,
              555,
              'content3',
            ),
            ArticleModel(
              4,
              555,
              'content4',
            ),
          ]);
      //2
      final results = await sut.getArticlesForAuthorId(555);
      //3
      expect(results, [
        ArticleModel(
          1,
          555,
          'content1',
        ),
        ArticleModel(
          3,
          555,
          'content3',
        ),
        ArticleModel(
          4,
          555,
          'content4',
        ),
      ]);
    });
  });
}
