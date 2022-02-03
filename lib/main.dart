import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(
  MaterialApp(home:GridLayout ())
);

class GridLayout extends StatelessWidget {

  List<String> events = [
    "ambulance",
    "background",
    "darurat",
    "default-user",
    "doctor",
    "education",
    "grafik",
    "jadwal",
    "lovely_time",
    "riwayat"
  ];

  @override
  Widget build(BuildContext context) {
    //create empty app with background
    return Scaffold(body: Container(decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover),),child: Container(
      margin: const EdgeInsets.only(top: 120.0),
      child: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: events.map((title){
          return GestureDetector(
            child: Card(
              margin: const EdgeInsets.all(20.0),
              child: getCardByTitle(title)),
            onTap: (){
            Fluttertoast.showToast(
                msg: title + " click",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
            );
          },);
        }) .toList(

        ),
      ),
    ),));
  }

  Column getCardByTitle(String title) {
    String img ="";
    if(title == "Jadwal")
      img = "assets/images/jadwal.png";
    else if(title == "ambulance")
      img = "assets/images/ambulance.png";
    else if(title == "darurat")
      img = "assets/images/darurat.png";
    else if(title == "doctor")
      img = "assets/images/doctor.png";
    // else if(title == "ambulance")
    //   img = "assets/images/doctor.png";
    else if(title == "education")
      img = "assets/images/education.png";
    else if(title == "grafik")
      img = "assets/images/grafik.png";
    else if(title == "riwayat")
      img = "assets/images/riwayat.png";
    else if(title == "Pasian Isoman")
      img = "assets/images/lovely_time.png";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        new Center(
          child: Container(
            child: new Stack(
              children: <Widget> [
              new Image.asset(
                img,
                width: 80.0,
                height: 80.0,
              )
            ],),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
           textAlign: TextAlign.center,
        )
      ],
    );
  }
}