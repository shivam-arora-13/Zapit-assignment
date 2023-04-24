import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CryptoInfoEvent extends Equatable {
  const CryptoInfoEvent();
}

class LoadCryptoInfoEvent extends CryptoInfoEvent {
  String cryptoId;

  LoadCryptoInfoEvent(this.cryptoId);

  @override
  List<Object?> get props => [cryptoId];
}
