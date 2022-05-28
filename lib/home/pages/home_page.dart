import 'package:catchem_ideas/auth/account_page.dart';
import 'package:catchem_ideas/home/cubit/home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../../calendar/pages/calendar_page.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.add_event,
        children: [
          SpeedDialChild(child: const Icon(Icons.mic), label: 'Voice'),
          SpeedDialChild(
              child: const Icon(Icons.edit_note),
              label: 'Text',
              onTap: () {
                FirebaseFirestore.instance.collection('ideas').add(
                  {
                    'title': controller.text,
                  },
                );
              }),
          SpeedDialChild(
            child: const Icon(Icons.camera_alt),
            label: 'Picture',
          ),
          SpeedDialChild(child: const Icon(Icons.videocam), label: 'Video'),
        ],
      ),
      backgroundColor: const Color.fromARGB(224, 140, 115, 207),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 15, top: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Catch'em ideas",
                          style: TextStyle(
                              color: Color(0xFF00003f),
                              fontSize: 34,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AccountPage(
                                                  email: "email")),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.person,
                                    size: 38,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Manage your thoughts',
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
                                builder: (context) => const CalendarPage()),
                          );
                        },
                        icon: const Icon(
                          Icons.calendar_today,
                          size: 34,
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

                            void submit() {
                              FirebaseFirestore.instance
                                  .collection('ideas')
                                  .add(
                                {
                                  'title': controller.text,
                                },
                              );
                              Navigator.of(context).pop();

                              controller.clear();
                            }

                            Future openDialog() => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text('Your Idea'),
                                      content: TextField(
                                        controller: controller,
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: submit,
                                          child: const Text('Submit'),
                                        )
                                      ],
                                    ));

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
                                Container(
                                    padding: const EdgeInsets.all(16),
                                    child: ElevatedButton(
                                      child: const Text('Add idea'),
                                      onPressed: () {
                                        openDialog();
                                      },
                                    )),
                              ],
                            );

                            return StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('ideas')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    return const Text('Error');
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Text('Loading');
                                  }

                                  final documents = snapshot.data!.docs;

                                  void submit() {
                                    FirebaseFirestore.instance
                                        .collection('ideas')
                                        .add(
                                      {
                                        'title': controller.text,
                                      },
                                    );
                                    Navigator.of(context).pop();

                                    controller.clear();
                                  }

                                  Future openDialog() => showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: const Text('Your Idea'),
                                            content: TextField(
                                              controller: controller,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: submit,
                                                child: const Text('Submit'),
                                              )
                                            ],
                                          ));

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
                                      Container(
                                          padding: const EdgeInsets.all(16),
                                          child: ElevatedButton(
                                            child: const Text('Add idea'),
                                            onPressed: () {
                                              openDialog();
                                            },
                                          )),
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IdeaTileWidget extends StatelessWidget {
  const IdeaTileWidget(
    this.title, {
    Key? key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        height: 100,
        width: 200,
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(title)],
        ));
  }
}
