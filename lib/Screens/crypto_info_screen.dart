import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zapit/Blocs/app_blocs.dart';
import 'package:zapit/Blocs/app_events.dart';
import 'package:zapit/Blocs/app_states.dart';
import 'package:zapit/Repositories/repositories.dart';

import 'package:zapit/Widgets/info_tile.dart';

class CryptoInfoScreen extends StatefulWidget {
  static const routeName = "/crypto-info";
  const CryptoInfoScreen({super.key});

  @override
  State<CryptoInfoScreen> createState() => _CryptoInfoScreenState();
}

class _CryptoInfoScreenState extends State<CryptoInfoScreen> {
  var params;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    params = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CryptoRepository(),
      child: BlocProvider(
        create: (context) => CryptoInfoBloc(
          RepositoryProvider.of<CryptoRepository>(context),
        )..add(LoadCryptoInfoEvent(params["id"])),
        child: Scaffold(
          appBar: AppBar(
            title: Text(params["name"]),
          ),
          body: BlocBuilder<CryptoInfoBloc, CryptoInfoState>(
              builder: (context, state) {
            if (state is CryptoInfoLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CryptoInfoErrorState) {
              return const Center(
                child: Text(
                  "Error loading data !!",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              );
            }

            if (state is CryptoInfoLoadedState) {
              return SingleChildScrollView(
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
                        child: Center(
                            child: Text(
                          params["id"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        )),
                      ),
                      const SizedBox(height: 15),
                      InfoTile(
                          "Open (₹)", state.cryptoData.open.toStringAsFixed(2)),
                      InfoTile(
                          "High (₹)", state.cryptoData.high.toStringAsFixed(2)),
                      InfoTile(
                          "Low (₹)", state.cryptoData.low.toStringAsFixed(2)),
                      InfoTile("Close (₹)",
                          state.cryptoData.close.toStringAsFixed(2)),
                      InfoTile(
                          "Volume", state.cryptoData.volume.toStringAsFixed(2)),
                      InfoTile("Market Cap (\$)",
                          state.cryptoData.market_cap.toStringAsFixed(2)),
                    ],
                  ),
                ),
              );
            }
            return const Scaffold();
          }),
        ),
      ),
    );
  }
}
