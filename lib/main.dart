import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nafith/bloc/auth_bloc.dart';
import 'package:nafith/bloc/notification_bloc.dart';
import 'package:nafith/repository/auth_data.dart';
import 'package:nafith/repository/notification_data.dart';
import 'package:nafith/screens/login_page.dart';
import 'package:nafith/screens/main_page.dart';

import 'AppLocalization.dart';
import 'SharedPref.dart';
import 'bloc/auth_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.changeLanguage(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthSharedPref pref=AuthSharedPref();
  Locale _locale=Locale('en');
  InitilaizerLanguage()async{
    String langCode=  await pref.getLanguageCode();

    setState(() {
      _locale=Locale('$langCode');
    });

  }
  changeLanguage(Locale locale) async{


    setState(() {

      _locale = locale;
    });
  }
  bool isAuth=false;
  @override
  void initState() {
    InitilaizerLanguage();
    pref.getIsLogged().then((value) => isAuth=value);
    super.initState();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>Auth_bloc( Aut_repo()),

        ),
        BlocProvider(create: (context)=>notification_bloc( notification_data()),

        )
      ],
      child: MaterialApp(  supportedLocales: [Locale("en"), Locale("ar")],
        localizationsDelegates: [
          AppLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        locale: _locale,
        localeResolutionCallback: (deviceLocal, supportedLocal) {
          for (var suppotedlocal in supportedLocal) {
            if (suppotedlocal.languageCode == deviceLocal!.languageCode)
              return suppotedlocal;
          }
          supportedLocal.first;
        },
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home:isAuth?MainPage():  LoginPage(),
        routes:
        {
          '/MainPage':(ctx)=>MainPage(),
          '/LoginPage':(ctx)=>LoginPage()
        },
      ),
    );
  }
}
