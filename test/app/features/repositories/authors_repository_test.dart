import 'package:catchem_ideas/app/features/repositories/authors_repository.dart';
import 'package:catchem_ideas/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockAuthorsDataSource extends Mock
    implements AuthorsRemoteRetrofitDataSource {}

void main() {
  late AuthorsRepository sut;
  late MockAuthorsDataSource dataSource;

  setUp(() {
    dataSource = MockAuthorsDataSource();
    sut = AuthorsRepository(remoteDataSource: dataSource);
  });

  group('getAuthorModels', () {
    test('should call remoteDataSource.getAuthors() method', () async {
      //1
      when(() => dataSource.getAuthors()).thenAnswer((_) async => []);
      //2
      await sut.getAuthorModels();
      //3
      verify(() => dataSource.getAuthors()).called(1);
    });
  });
}
