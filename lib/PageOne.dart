import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  static DateTime now = DateTime.now();
  String tanggal = DateFormat('yyyy-MM-dd').format(now);
  String jam;
  final double barHeight = 50.0;
  double masuk = 20;
  double sakit = 20;
  double izin = 20;
  double tanpaketerangan = 20;
  double alfa = 20;

  String nama, statuskehadiran, nis;

  Widget qrcode() {
    return QrImage(
      version: 6,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      errorCorrectionLevel: QrErrorCorrectLevel.M,
      padding: EdgeInsets.all(0),
      size: 300,
      data: "https://kassekolah.000webhostapp.com/scan_absen_siswa/absen/$nis/$tanggal",
    );
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nis = preferences.getString("nis");
      nama = preferences.getString("nama_siswa");
    });
  }

  Widget tes;

  Future<void> _authorizeNow() async {
    setState(() {
      tes = qrcode();
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

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
                height: 49,
                alignment: Alignment.topLeft,
                child: Column(
                  children: <Widget>[
                    Container(
                  width: 300,
                  height: 46,
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Selamat Datang $nama",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ],
                  ),
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
                  child: tes,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: FlatButton(
                  onPressed: _authorizeNow,
                  child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    child: Center(
                      child: Text(
                        'GENERATE QR CODE',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}