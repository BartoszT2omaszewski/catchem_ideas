import 'package:catchem_ideas/app/core/enums.dart';
import 'package:catchem_ideas/app/features/articles/cubit/articles_cubit.dart';
import 'package:catchem_ideas/app/features/models/article_model.dart';
import 'package:catchem_ideas/app/features/models/author_model.dart';
import 'package:catchem_ideas/app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({
    Key? key,
    required this.author,
  }) : super(key: key);

  final AuthorModel author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(author.name),
      ),
      body: BlocProvider<ArticlesCubit>(
        create: (context) => getIt()
          ..fetchData(
            authorId: author.id,
          ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(author.picture),
                radius: 50,
              ),
            ),
            Expanded(
              child: BlocBuilder<ArticlesCubit, ArticlesState>(
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
                      if (state.results.isEmpty) {
                        return const Center(
                          child: Text('No articles found'),
                        );
                      }
                      return ListView(
                        children: [
                          for (final author in state.results)
                            _ArticleItemWidget(
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
          ],
        ),
      ),
    );
  }
}

class _ArticleItemWidget extends StatelessWidget {
  const _ArticleItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ArticleModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          color: Colors.black12,
          child: Row(
            children: [
              Expanded(
                child: Text(model.content),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
