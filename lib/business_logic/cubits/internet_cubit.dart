import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fruit_ninja/constant/enums.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? _subscription;

  InternetCubit({required this.connectivity}) : super(InternetInitial()){
    _subscription = connectivity.onConnectivityChanged.listen((connectivityResult) {
      if(connectivityResult == ConnectivityResult.wifi){
        emitInternetConnected(ConnectionType.Wifi);
      }else if(connectivityResult == ConnectivityResult.mobile){
        emitInternetConnected(ConnectionType.Mobile);
      }if(connectivityResult == ConnectivityResult.none){
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) => emit(InternetConnected(connectionType: _connectionType));
  void emitInternetDisconnected() => emit(InternetDisconnected());
}
