import 'package:flutter/material.dart';

import 'package:zapit/Screens/crypto_info_screen.dart';
import 'package:zapit/Screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zapit',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        CryptoInfoScreen.routeName: (ctx) => CryptoInfoScreen(),
      },
    );
  }
}
