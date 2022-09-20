import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafith/bloc/auth_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SharedPref.dart';
import '../repository/auth_data.dart';
import 'auth_event.dart';

class Auth_bloc extends Bloc<Auth_event, Auth_state> {
  AuthSharedPref pref=AuthSharedPref();
  Aut_repo repository;
  Auth_bloc(this.repository) : super(LoginLoadingState()) {

    on<LoginButtonPressed>((event, emit) async {
      var data= await   repository.validateLogin(event.UserName, event.Password);
  if(data==null)    emit(LoginLoadingState());
      try{



    if (data != null && data=="LOGIN.SUCCESS") {
    pref.setIsLogged(true);
       emit(UserLoginSuccess());
     } else {

       emit(UserLoginFaild("Invalid User"));

     }
      }
      catch(e){}


    });
  }
}
