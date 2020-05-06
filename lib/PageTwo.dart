import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageTwo extends StatefulWidget {
  final VoidCallback keluar;
  PageTwo(this.keluar);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  keluar() {
    setState(() {
      widget.keluar();
    });
  }

  String nis,
      nama,
      foto,
      agama,
      kelamin,
      tanggallahir,
      tempatlahir,
      alamat,
      notelpon;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nis = preferences.getString("nis");
      nama = preferences.getString("nama_siswa");
      foto = preferences.getString("foto");
      agama = preferences.getString("agama");
      kelamin = preferences.getString("kelamin");
      tanggallahir = preferences.getString("tanggal_lahir");
      tempatlahir = preferences.getString("tempat_lahir");
      alamat = preferences.getString("alamat");
      notelpon = preferences.getString("no_telpon");
    });
    print(foto);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: 280,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 300,
                  height: 44,
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Profile",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  width: 300,
                  height: 300,
                  child: CachedNetworkImage(
                    imageUrl: "https://kassekolah.000webhostapp.com/assets/upload/image/$foto",
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                    width: 400,
                  ),
                ),
                Container(
                    width: 260,
                    height: 30,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Data Diri",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 25, left: 5),
                            child: Icon(Icons.perm_identity,
                                size: 26, color: Colors.black87)),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 40),
                              child: Column(
                                children: <Widget>[
                                  Text("NIS: \n $nis",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 25, left: 5),
                            child: Icon(Icons.perm_identity,
                                size: 26, color: Colors.black87)),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                children: <Widget>[
                                  Text("Nama: \n $nama",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 25, left: 5),
                            child: Icon(Icons.supervisor_account,
                                size: 26, color: Colors.black87)),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                children: <Widget>[
                                  Text("Kelamin: \n $kelamin",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 25, left: 5),
                            child: Icon(Icons.favorite,
                                size: 26, color: Colors.black87)),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                children: <Widget>[
                                  Text("Agama: \n $agama",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 25, left: 5),
                            child: Icon(Icons.date_range,
                                size: 26, color: Colors.black87)),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                children: <Widget>[
                                  Text("Tanggal Lahir: \n $tanggallahir",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 25, left: 5),
                            child: Icon(Icons.place,
                                size: 26, color: Colors.black87)),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                children: <Widget>[
                                  Text("Tempat Lahir: \n $tempatlahir",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 25, left: 5),
                            child: Icon(Icons.home,
                                size: 26, color: Colors.black87)),
                        Column(
                          children: <Widget>[
                            Container(
                              width: 254,
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                children: <Widget>[
                                  Text("Alamat: \n $alamat",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    width: 300,
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 25, left: 5),
                            child: Icon(Icons.call,
                                size: 26, color: Colors.black87)),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Column(
                                children: <Widget>[
                                  Text("No Telpon: \n $notelpon",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 30),
                  child: GestureDetector(
                    onTap: () {
                      keluar();
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(32)),
                      ),
                      child: Center(
                        child: Text(
                          'KELUAR ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
