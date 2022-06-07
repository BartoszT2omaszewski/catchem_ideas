
import 'package:catchem_ideas/app/features/auth/user_profile.dart';
import 'package:catchem_ideas/app/features/home/cubit/home_cubit.dart';
import 'package:catchem_ideas/app/features/home/pages/home_body.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..start(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              title: const Text(
                "Catch'em ideas",
                style: TextStyle(
                    color: Color.fromARGB(255, 16, 16, 48),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 32.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile(
                                )),
                      );
                    },
                    icon: const Icon(
                      Icons.person,
                      size: 38,
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: const Color.fromARGB(223, 134, 104, 218),
            body: const HomePageBody(
            ),
            floatingActionButton: SpeedDial(
              animatedIcon: AnimatedIcons.add_event,
              children: [
                SpeedDialChild(child: const Icon(Icons.mic), label: 'Voice'),
                SpeedDialChild(
                    child: const Icon(Icons.edit_note),
                    label: 'Text',
                    onTap: () {
                      runDialog(context, submit);
                    }),
                SpeedDialChild(
                  child: const Icon(Icons.camera_alt),
                  label: 'Picture',
                ),
                SpeedDialChild(
                    child: const Icon(Icons.videocam), label: 'Video'),
              ],
            ),
          );
        },
      ),
    );
  }

  void submit() {
    FirebaseFirestore.instance.collection('ideas').add(
      {
        'title': controller.text,
      },
    );
    Navigator.of(context).pop();

    controller.clear();
  }

  Future<dynamic> runDialog(BuildContext context, submit) {
    return showDialog(
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
  }
}
