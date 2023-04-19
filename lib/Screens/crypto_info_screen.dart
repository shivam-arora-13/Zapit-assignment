import 'package:flutter/material.dart';
import 'package:zapit/Widgets/info_tile.dart';

class CryptoInfoScreen extends StatefulWidget {
  static const routeName = "/crypto-info";
  const CryptoInfoScreen({super.key});

  @override
  State<CryptoInfoScreen> createState() => _CryptoInfoScreenState();
}

class _CryptoInfoScreenState extends State<CryptoInfoScreen> {
  // var cryptoId;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // cryptoId = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  Widget build(BuildContext context) {
    Map data = {
      // "1a. open (CNY)": "208862.56875000",
      "Open (USD)": "30380.01000000",
      // "2a. high (CNY)": "209093.01875000",
      "High (USD)": "30413.53000000",
      // "3a. low (CNY)": "208274.96250000",
      "Low (USD)": "30294.54000000",
      // "4a. close (CNY)": "208358.56250000",
      "Close (USD)": "30306.70000000",
      "Volume": "943.81422000",
      "Market cap (USD)": "943.81422000"
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bitcoin"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                    child: Text(
                  "BTC",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                )),
              ),
              const SizedBox(height: 15),
              for (var item in data.entries)
                InfoTile(item.key,
                    double.parse(item.value.toString()).toStringAsFixed(2)),
            ],
          ),
        ),
      ),
    );
  }
}
