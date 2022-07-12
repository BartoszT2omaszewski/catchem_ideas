import 'package:catchem_ideas/app/features/add/pages/add_page.dart';
import 'package:catchem_ideas/app/features/auth/user_profile.dart';
import 'package:catchem_ideas/app/features/home/pages/home_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 24.0),
          child: Text(
            "Catch'em ideas",
            style:
                GoogleFonts.pacifico(fontSize: 36, fontWeight: FontWeight.w200),
          ),
        ),
        actions: const [
          UserProfileButton(),
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
  }
}

class UserProfileButton extends StatelessWidget {
  const UserProfileButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UserProfile()),
          );
        },
        icon: const Icon(
          Icons.person,
          size: 38,
        ),
      ),
    );
  }
}
