import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          const HomeState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const HomeState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('ideas')
        .snapshots()
        .listen((data) {
      emit(
        HomeState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          HomeState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

// Future submit(
//   BuildContext context,
//    submit,
//   controller,
// ) async {
//   FirebaseFirestore.instance.collection('ideas').add(
//     {
//       'title': controller.text,
//     },
//   );
//   Navigator.of(context).pop();

//   controller.clear();
// }

// Future openDialog(
//   BuildContext context,
//   submit,
//   controller,
// ) async {
//   return showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//             title: const Text('Your Idea'),
//             content: TextField(
//               controller: controller,
//             ),
//             actions: [
//               TextButton(
//                 onPressed: submit,
//                 child: const Text('Submit'),
//               )
//             ],
//           ));
// }
