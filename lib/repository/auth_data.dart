import 'dart:convert';

import 'package:http/http.dart' as http;
class Aut_repo
{
  static const  String apiLink="http://82.212.90.190:7777/rest/OmanAPI_dev/NAFITH_API";
String ValidationMsg="";
   validateLogin(String username,String password)async{
    var url=Uri.parse(apiLink);
    var headers={'Content-Type':'application/x-www-form-urlencoded'};
    var request=http.Request('POST',url);
    request.bodyFields={
      'args':'{"USERNAME":"$username","PASSWORD":"$password"}'};
    request.headers.addAll(headers);
    http.StreamedResponse response=await request.send();

      http.Response.fromStream(response).then((res)async {

        var data = await json.decode(res.body);
        if( res.statusCode==200){

          ValidationMsg=data["MESSAGE"];
          print("");
          return  data["MESSAGE"];
        }
        else{
          ValidationMsg=data["MESSAGE"];
          print(res.reasonPhrase);
          return   data["MESSAGE"];}


      });





return ValidationMsg;

  }
}