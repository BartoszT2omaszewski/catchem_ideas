import 'package:catchem_ideas/app/core/enums.dart';
import 'package:catchem_ideas/app/features/articles/page/articles_page.dart';
import 'package:catchem_ideas/app/features/models/author_model.dart';
import 'package:catchem_ideas/app/features/motivation/cubit/motivation_cubit.dart';
import 'package:catchem_ideas/app/features/repositories/authors_repository.dart';
import 'package:catchem_ideas/data/remote_data_sources/authors_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MotivationPage extends StatelessWidget {
  const MotivationPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<MotivationCubit>(
        create: (context) {
          return MotivationCubit(
            authorsRepository: AuthorsRepository(
              remoteDataSource: AuthorsRemoteDioDataSource(),
            ),
          )..start();
        },
        child: BlocBuilder<MotivationCubit, MotivationState>(
          builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return const Center(
                  child: Text('Initial state'),
                );
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.success:
                return ListView(
                  children: [
                    for (final author in state.results)
                      _AuthorItemWidget(
                        model: author,
                      ),
                  ],
                );
              case Status.error:
                return Center(
                  child: Text(
                    state.errorMessage ?? 'Unknown error',
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}

class _AuthorItemWidget extends StatelessWidget {
  const _AuthorItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final AuthorModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ArticlesPage(author: model),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          color: Colors.black12,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  model.picture,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(model.name),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_right,
                color: Colors.black26,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
