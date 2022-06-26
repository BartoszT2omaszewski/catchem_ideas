import 'package:catchem_ideas/app/features/models/author_model.dart';
import 'package:catchem_ideas/data/remote_data_sources/authors_remote_data_source.dart';

class AuthorsRepository {
  AuthorsRepository({required this.remoteDataSource});

  final AuthorsRemoteDioDataSource remoteDataSource;

  Future<List<AuthorModel>> getAuthorModels() async {
    final json = await remoteDataSource.getAuthors();
    if (json == null) {
      return [];
    }
    return json.map((item) => AuthorModel.fromJson(item)).toList();
  }
}
