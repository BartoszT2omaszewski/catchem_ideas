import 'package:catchem_ideas/app/cubit/root_cubit.dart';
import 'package:catchem_ideas/app/features/home/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({
    Key? key,
    required this.email,
    required this.user,
  }) : super(key: key);

  final String? email;
  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => HomePage(
                                  user: user,
                                )),
                          ),
                        );
                      },
                      child: const Icon(Icons.arrow_back)),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("You're logged in as $email"),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<RootCubit>().signOut();
                      },
                      child: const Text('Log out'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
