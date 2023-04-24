import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:zapit/Models/crypto_info_model.dart';

@immutable
abstract class CryptoInfoState extends Equatable {}

//Data Loading State
class CryptoInfoLoadingState extends CryptoInfoState {
  @override
  List<Object?> get props => [];
}

//Data Loaded State
class CryptoInfoLoadedState extends CryptoInfoState {
  final CryptoInfoModel cryptoData;

  CryptoInfoLoadedState(this.cryptoData);

  @override
  List<Object?> get props => [cryptoData];
}

//Data Error Loading State
class CryptoInfoErrorState extends CryptoInfoState {
  final String errorMsg;

  CryptoInfoErrorState(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
