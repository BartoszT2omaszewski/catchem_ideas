import 'package:catchem_ideas/app/features/home/cubit/home_cubit.dart';
import 'package:catchem_ideas/app/features/home/idea_tile.dart';
import 'package:catchem_ideas/app/features/manager/pages/idea_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  State<HomePageBody> createState() => HomePageBodyState();
}

class HomePageBodyState extends State<HomePageBody> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Thought inTime Manager',
                  style: TextStyle(
                      color: Color(0xFF00003f),
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ManagerPage()),
                      );
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                      size: 36,
                    )),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 6.0),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [BoxShadow(blurRadius: 10.0)],
                  ),
                  child: BlocProvider(
                    create: (context) => HomeCubit()..start(),
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        if (state.errorMessage.isNotEmpty) {
                          return Text('Error: ${state.errorMessage}');
                        }

                        if (state.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final documents = state.documents;

                        return ListView(
                          children: [
                            for (final document in documents) ...[
                              Dismissible(
                                key: ValueKey(document.id),
                                onDismissed: (_) {
                                  FirebaseFirestore.instance
                                      .collection('ideas')
                                      .doc(document.id)
                                      .delete();
                                },
                                child: IdeaTileWidget(
                                  document['title'],
                                ),
                              ),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
