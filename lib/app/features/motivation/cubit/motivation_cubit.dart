import 'package:catchem_ideas/app/core/enums.dart';
import 'package:catchem_ideas/app/features/models/author_model.dart';
import 'package:catchem_ideas/app/features/repositories/authors_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'motivation_state.dart';

@injectable
class MotivationCubit extends Cubit<MotivationState> {
  MotivationCubit({required this.authorsRepository}) : super(MotivationState());

  final AuthorsRepository authorsRepository;

  Future<void> start() async {
    emit(
      MotivationState(
        status: Status.loading,
      ),
    );
    try {
      final results = await authorsRepository.getAuthorModels();
      emit(
        MotivationState(
          status: Status.success,
          results: results,
        ),
      );
    } catch (error) {
      emit(
        MotivationState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
