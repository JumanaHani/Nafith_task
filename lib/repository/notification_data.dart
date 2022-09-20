import 'package:shared_preferences/shared_preferences.dart';

class notification_data
{
  Future<void> setIsEnabledNotification(bool value)async{
    SharedPreferences pref=await SharedPreferences.getInstance();

    pref.setBool("IsEnable",value);



  }
  Future<bool> getIsEnabledNotification () async {// use the return value to check if the notification enabled or not
    SharedPreferences pref=await SharedPreferences.getInstance();
    var response= await  pref.getBool("IsEnable");

    return response??false;

  }
}