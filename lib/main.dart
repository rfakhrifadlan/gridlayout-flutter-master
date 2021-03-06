import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(
    MaterialApp(home:GridLayout())
);

class GridLayout extends StatelessWidget {
  List<String> events = [
    "Transfer",
    "Profile",
    "Pertanyaan",
    "Pengaturan"
  ];

  @override
  Widget build(BuildContext context){

    return Scaffold(body: Container(decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/bg.png"), fit: BoxFit.cover),),child: Container(
      margin: const EdgeInsets.only(top: 120.0),
      child: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: events.map((title){

        return GestureDetector(
          child: Card(
            margin: const EdgeInsets.all(20.0),
            child: getCardByTitle(title)),
          onTap: (){
          Fluttertoast.showToast(
            msg: "Tap "+title,
            toastLength:Toast.LENGTH_SHORT,
            gravity:ToastGravity.CENTER,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0
          );
        },);
        }).toList(),
    ),
    ),));
  }

  Column getCardByTitle(String title) {
    String img = "";
    if(title == "Transfer")
      img = "assets/transfer.png";
    else if(title == "Profile")
      img = "assets/profile.png";
    else if(title == "Pertanyaan")
      img = "assets/help.png";
    else if(title == "Pengaturan")
      img = "assets/settings.png";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
              margin: const EdgeInsets.all(20.0),
            child: new Stack(
              children: <Widget>[
                new Image.asset(
                  img,
                  width: 80.0,
                  height: 80.0,
                )
              ],
            )),
        ),
        Text(
          title,
          style:TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,

        )
      ],
    );
  }
}
