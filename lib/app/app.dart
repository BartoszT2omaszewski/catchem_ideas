import 'package:catchem_ideas/app/cubit/root_cubit.dart';
import 'package:catchem_ideas/app/features/auth/login_page.dart';
import 'package:catchem_ideas/app/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Catch'em ideas",
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const RootPage(),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null) {
          return LoginPage();
        }
        return HomePage(user: user);
        // AccountPage(email: user.email, user: user);
      },
    );
  }
}
