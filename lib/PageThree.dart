import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(length: 1, child: PageThree()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  static DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy - kk:mm').format(now);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10),
                width: 300,
                height: 44,
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text("About",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                width: 300,
                height: 320,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(20),
                  child: Text(
                      "Sebuah aplikasi Absensi menggunakan QR Code yang dibuat oleh Dimas Aditya Mukhsinin menggunakan flutter. Digunakan untuk mempermudah dalam melakukan Absensi \n \n \n \n Kontak : \n  Email : dimasadityamukhsinin@gmail.com \n No Telpon : 082268186048 \n Facebook : Dimas Aditya Mukhsinin \n Instagram : @dimasadityamukhsinin ",
                      style: TextStyle(fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
