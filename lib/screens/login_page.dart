import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafith/SharedPref.dart';
import 'package:nafith/bloc/auth_bloc.dart';
import 'package:nafith/bloc/auth_event.dart';
import 'package:nafith/bloc/auth_state.dart';
import 'package:nafith/controller/api.dart';

import '../AppLocalization.dart';
class LoginPage extends StatefulWidget {
   LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
var _userName=TextEditingController();

   var _pass=TextEditingController();

   late Auth_bloc authBlock;

@override
void initState() {
   authBlock=BlocProvider.of<Auth_bloc>(context);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  final InvalidLogin=BlocBuilder<Auth_bloc,Auth_state>(builder: (context,state){
if(state is UserLoginFaild)
    return Text(state.errorMsg);

else
  return Container();
  });
    return SafeArea(child: Scaffold(body:
      BlocListener<Auth_bloc,Auth_state>(
        listener: (context,state){

          if(state is LoginLoadingState || State is InitLoginState)
            { const Center(child: CircularProgressIndicator(),);}
          if(state is UserLoginSuccess)
            {
              Navigator.pushNamed(context,'/MainPage');
            }
          else {print("Not Valid");}
        },
        child: Center(
          child: SizedBox(width: MediaQuery.of(context).size.width*0.8,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [
              InvalidLogin,
              TextField(controller: _userName,decoration:  InputDecoration(hintText: AppLocalization.of(context).translate("UserName")),),
              TextField(controller: _pass,decoration:  InputDecoration(hintText: AppLocalization.of(context).translate("Password")),obscureText: true,),
              ElevatedButton(onPressed: ()async{

          authBlock.add(LoginButtonPressed(_userName.text, _pass.text));
              }, child:  Text(AppLocalization.of(context).translate("Login")))
            ],),
          ),
        ),
      )
      ,));
  }
}
