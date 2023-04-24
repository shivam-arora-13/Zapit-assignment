import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zapit/Blocs/app_events.dart';
import 'package:zapit/Blocs/app_states.dart';
import 'package:zapit/Models/crypto_info_model.dart';
import 'package:zapit/Repositories/repositories.dart';

class CryptoInfoBloc extends Bloc<CryptoInfoEvent, CryptoInfoState> {
  final CryptoRepository _cryptoRepository;

  CryptoInfoBloc(this._cryptoRepository) : super(CryptoInfoLoadingState()) {
    on<LoadCryptoInfoEvent>((event, emit) async {
      emit(CryptoInfoLoadingState());

      try {
        final CryptoInfoModel data =
            await _cryptoRepository.getCryptoInfo(event.cryptoId);
        emit(CryptoInfoLoadedState(data));
      } catch (e) {
        emit(CryptoInfoErrorState(e.toString()));
      }
    });
  }
}
