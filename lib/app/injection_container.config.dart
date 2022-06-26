// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/remote_data_sources/articles_remote_data_source.dart' as _i7;
import '../data/remote_data_sources/authors_remote_data_source.dart' as _i9;
import 'features/add/cubit/add_cubit.dart' as _i4;
import 'features/articles/cubit/articles_cubit.dart' as _i12;
import 'features/home/cubit/home_cubit.dart' as _i6;
import 'features/motivation/cubit/motivation_cubit.dart' as _i11;
import 'features/repositories/articles_repository.dart' as _i8;
import 'features/repositories/authors_repository.dart' as _i10;
import 'features/repositories/items_repository.dart' as _i3;
import 'injection_container.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.ItemsRepository>(() => _i3.ItemsRepository());
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.factory<_i4.AddCubit>(() => _i4.AddCubit(get<_i3.ItemsRepository>()));
  gh.lazySingleton<_i5.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i6.HomeCubit>(() => _i6.HomeCubit(get<_i3.ItemsRepository>()));
  gh.factory<_i7.ArticlesRemoteRetrofitDataSource>(
      () => _i7.ArticlesRemoteRetrofitDataSource(get<_i5.Dio>()));
  gh.factory<_i8.ArticlesRepository>(() => _i8.ArticlesRepository(
      remoteDataSource: get<_i7.ArticlesRemoteRetrofitDataSource>()));
  gh.factory<_i9.AuthorsRemoteRetrofitDataSource>(
      () => _i9.AuthorsRemoteRetrofitDataSource(get<_i5.Dio>()));
  gh.factory<_i10.AuthorsRepository>(() => _i10.AuthorsRepository(
      remoteDataSource: get<_i9.AuthorsRemoteRetrofitDataSource>()));
  gh.factory<_i11.MotivationCubit>(() =>
      _i11.MotivationCubit(authorsRepository: get<_i10.AuthorsRepository>()));
  gh.factory<_i12.ArticlesCubit>(() =>
      _i12.ArticlesCubit(articlesRepository: get<_i8.ArticlesRepository>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
