import 'dart:async';

import 'package:catchem_ideas/app/features/repositories/items_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._itemsRepository) : super(const AddState());

  final ItemsRepository _itemsRepository;

  Future<void> add(
    String title,
    DateTime ideaDate,
  ) async {
    try {
      await _itemsRepository.add(title, ideaDate);
      emit(const AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
