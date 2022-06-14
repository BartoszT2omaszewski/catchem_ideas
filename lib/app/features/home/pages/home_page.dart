import 'package:catchem_ideas/app/features/add/pages/add_page.dart';
import 'package:catchem_ideas/app/features/auth/user_profile.dart';
import 'package:catchem_ideas/app/features/home/cubit/home_cubit.dart';
import 'package:catchem_ideas/app/features/home/pages/home_body.dart';
import 'package:catchem_ideas/app/features/repositories/items_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (context) => HomeCubit(ItemsRepository())..start(),
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
              title: const Padding(
                padding: EdgeInsets.only(right: 24.0),
                child: Text(
                  "Catch'em ideas",
                  style: TextStyle(
                      color: Color.fromARGB(255, 16, 16, 48),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserProfile()),
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
            body: const HomePageBody(),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AddPage(),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
