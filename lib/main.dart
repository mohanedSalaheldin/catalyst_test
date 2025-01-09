import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'features/users/presentation/pages/users_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalyst',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor('#eeede7'),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        colorScheme: const ColorScheme.light(),

        useMaterial3: true,
      ),
      home: const UsersScreen(),
    );
  }
}
