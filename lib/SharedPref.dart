import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class AuthSharedPref with ChangeNotifier
{

  Future<void> setLanguageCode(String code)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setString("LngCode", code);

  }
  Future<String> getLanguageCode () async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    var response= await  pref.getString("LngCode");
    notifyListeners();
    return response??"en";

  }


  Future<void> setIsLogged(bool isAuth)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool("isAuth", isAuth);


  }
  Future<bool> getIsLogged () async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    var response= await  pref.getBool("isAuth");

    return response??false;

  }





}