import 'package:flutter/material.dart';

class cardItems extends StatefulWidget {
  cardItems({Key? key}) : super(key: key);

  @override
  State<cardItems> createState() => _cardItemsState();
}

class _cardItemsState extends State<cardItems> {
  bool isExpande = false;



  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.16),
                      blurRadius: 6.0,
                      offset: const Offset(
                          1.0, 5.0), // shadow direction: bottom right
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Column(children: [
                ListTile(
                    leading: const Icon(Icons.more_vert_outlined),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage("images/van.jpg"))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ار 545454'),
                            SizedBox(
                                width: 200,
                                child: Row(
                                  children: [
                                    Icon(Icons.person_add_alt_rounded),
                                    Text('حمزة عبدالله أبو سنينة')
                                  ],
                                )),
                          ],
                        ),
                      ],
                    )),
                (isExpande?? true)
                    ? Column(
                  children: [
                    Divider(),
                    ListTile(onTap: (){

                      },
                      leading: Icon(Icons.remove_red_eye_rounded,color: Colors.blue,),
                      title: Text("خدمة التوفير على المنصة"),
                      trailing: Switch(value: true, onChanged: (bool value) {  },),
                    ),
                    ListTile(
                      leading: Icon(Icons.remove_red_eye_rounded),
                      title: Text("خدمة التتبع"),
                      trailing: Switch(value: false, onChanged: (bool value) {  },),
                    ),
                  ],
                )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isExpande = !isExpande;
                        });


                      },
                      icon:!isExpande? Icon(Icons.keyboard_arrow_down_outlined):Icon(Icons.keyboard_arrow_up_rounded),
                    ),
                    Text("الخدمات"),
                  ],
                ),

              ]));

  }
}
