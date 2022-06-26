import 'package:catchem_ideas/app/features/models/author_model.dart';
import 'package:catchem_ideas/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthorsRepository {
  AuthorsRepository({required this.remoteDataSource});

  final AuthorsRemoteRetrofitDataSource remoteDataSource;

  Future<List<AuthorModel>> getAuthorModels() async {
    return remoteDataSource.getAuthors();
  }
}
