import 'package:flutter/material.dart';

import '../Widgets/card.dart';
import '../Widgets/sideBar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: AppBar(actions: [

        ],),
          drawer: SideBar(),
          backgroundColor: Colors.white70,
      body: Directionality(textDirection: TextDirection.rtl,
        child: Center(
          child: Container(width: MediaQuery.of(context).size.width*0.9,
            child: ListView(padding: EdgeInsets.only(top: 10),
              children: [
                cardItems(),
                cardItems()

              ],
            ),
          ),
        ),
      ),
    ));
  }
}
