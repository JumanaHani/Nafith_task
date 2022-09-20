import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafith/bloc/auth_state.dart';
import 'package:nafith/bloc/notification_event.dart';
import 'package:nafith/bloc/notification_state.dart';
import 'package:nafith/repository/notification_data.dart';

import '../SharedPref.dart';
import '../repository/auth_data.dart';
import 'auth_event.dart';

class notification_bloc extends Bloc<notification_event, notification_state> {
  AuthSharedPref pref=AuthSharedPref();
  notification_data repository;
  notification_bloc(this.repository) : super(InitState()) {
    on<switchPressed>((event, emit) async {
      emit(InitState());
      try{
         await   repository.setIsEnabledNotification(event.value);

        if (event.value) {

          emit(Enabled());
        } else {

          emit(Disable());

        }
      }
      catch(e){}


    });
  }
}
