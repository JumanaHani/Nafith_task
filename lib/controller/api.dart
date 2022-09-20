import 'package:http/http.dart' as http;
class API {
 static const  String apiLink="http://82.212.90.190:7777/rest/OmanAPI_dev/NAFITH_API";

 static Future<void> validateLogin(String username,String password)async{
   var url=Uri.parse(apiLink);
   var headers={'Content-Type':'application/x-www-form-urlencoded'};
   var request=http.Request('POST',url);
   request.bodyFields={
     'args':'{"USERNAME":"NAFITH","PASSWORD":"a123456"}'};
   request.headers.addAll(headers);
   http.StreamedResponse response=await request.send();
   if(response.statusCode==200){
     print(await response.stream.toList());
   }
   else{print(response.reasonPhrase);}
   }
 }
