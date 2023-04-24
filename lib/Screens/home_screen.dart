import 'package:flutter/material.dart';
import 'package:zapit/Assets/crypto_currency_list.dart';

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
        itemCount: currency_list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                currency_list.values.elementAt(index),
                style: const TextStyle(fontWeight: FontWeight.w800),
              ),
              trailing: Text(currency_list.keys.elementAt(index)),
              onTap: () {
                Navigator.of(context).pushNamed(
                  CryptoInfoScreen.routeName,
                  arguments: {
                    "id": currency_list.keys.elementAt(index),
                    "name": currency_list.values.elementAt(index),
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
