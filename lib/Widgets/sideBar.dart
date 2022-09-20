import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nafith/bloc/notification_bloc.dart';
import 'package:nafith/bloc/notification_event.dart';
import 'package:nafith/bloc/notification_state.dart';
import 'package:nafith/repository/notification_data.dart';

import '../SharedPref.dart';
import '../main.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
   bool isEnable=false;
  String SelectedLangCode = 'en';
  late notification_bloc notificationBlock;
@override
  void initState() {

  notificationBlock=BlocProvider.of<notification_bloc>(context);
  notification_data().getIsEnabledNotification().then((value) => isEnable=value);
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pref = AuthSharedPref();
    pref.getLanguageCode().then((value) {
      setState(() {
        SelectedLangCode = value;
      });
    });
    return Container(
      color: Colors.grey,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          BlocListener<notification_bloc,notification_state>(
            listener: (context,state){
              if(state is InitState)
              { const Center(child: CircularProgressIndicator(),);}
              if(state is Enabled)
              {
                isEnable=true;
              }
              else { isEnable=false;}
            },
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text("Notification"),
              trailing: Switch(
                value: isEnable,
                onChanged: (bool value) {
                  notificationBlock.add(switchPressed(value));
                },
              ),
            ),
          ),
          const ListTile(
              leading: Icon(Icons.language), title: Text("Change Language")),
          Container(height: 120,padding: EdgeInsets.only(left: 50),

            child: Column(children: [
              ListTile(
                onTap: () async {
                  Locale newLocale = Locale('ar');
                  await pref.setLanguageCode('ar');
                  MyApp.setLocale(context, newLocale);
                },
                title: Container(
                    child: Text(
                        "Arabic")),
              ),
              ListTile(
                onTap: () async {
                  Locale newLocale = Locale('en');
                  await pref.setLanguageCode('en');
                  MyApp.setLocale(context, newLocale);
                },
                title: Container(
                    child: const Text(
                        "English")),
              ),
            ],)


          ),
          GestureDetector(
              onTap: () {
                pref.setIsLogged(false);
                Navigator.pushNamed(context, '/LoginPage');
              },
              child:
                  const ListTile(leading: Icon(Icons.logout), title: Text("Logout")))
        ],
      ),
    );
  }
}
