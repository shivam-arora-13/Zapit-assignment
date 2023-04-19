import 'package:flutter/material.dart';

import 'package:zapit/Screens/crypto_info_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final CryptoInfoBloc _cryptoInfoBloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Zapit"),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: const Text(
                "Bitcoin",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              trailing: const Text("BTC"),
              onTap: () {
                Navigator.of(context).pushNamed(
                  CryptoInfoScreen.routeName,
                  // arguments: index.toString(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
