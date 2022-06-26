import 'package:catchem_ideas/app/features/models/author_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'authors_remote_data_source.g.dart';

@injectable
@RestApi()
abstract class AuthorsRemoteRetrofitDataSource {
  @factoryMethod
  factory AuthorsRemoteRetrofitDataSource(Dio dio) =
      _AuthorsRemoteRetrofitDataSource;

  @GET("/users")
  Future<List<AuthorModel>> getAuthors();
}
