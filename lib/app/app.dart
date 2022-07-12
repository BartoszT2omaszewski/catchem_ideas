import 'package:catchem_ideas/app/features/auth/auth_gate.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: true,
      debugShowCheckedModeBanner: false,
      title: "Catch'em ideas",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AuthGate(),
    );
  }
}
