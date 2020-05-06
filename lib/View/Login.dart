import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rich_alert/rich_alert.dart';
import 'package:sim/View/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:sim/model/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum LoginStatus { tidaklogin, login }

class _LoginPageState extends State<LoginPage> {
  LoginStatus loginStatus = LoginStatus.tidaklogin;
  final key = GlobalKey<FormState>();
  String nis, password;
  String msg = '';
  bool secureText = true;

  showHide() {
    setState(() {
      secureText = !secureText;
    });
  }

  check() {
    final form = key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post(Config.login, body: {
      "nis": nis,
      "password": password,
    });

    final data = json.decode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String datanis = data['nis'];
    String nama = data['nama_siswa'];
    String foto = data['foto'];
    String agama = data['agama'];
    String kelamin = data['kelamin'];
    String tanggallahir = data['tanggal_lahir'];
    String tempatlahir = data['tempat_lahir'];
    String alamat = data['alamat'];
    String notelpon = data['no_telpon'];
    if (value == 1) {
      setState(() {
        loginStatus = LoginStatus.login;
        savePref(value, datanis, nama, foto, agama, kelamin, tanggallahir,
            tempatlahir, alamat, notelpon);
      });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return RichAlertDialog(
              //uses the custom alert dialog
              alertTitle: richTitle("Peringatan!"),
              alertSubtitle: richSubtitle("NIS atau Password salah!"),
              alertType: RichAlertType.WARNING,
            );
          });
    }
  }

  savePref(
    int value,
    String datanis,
    String nama,
    String foto,
    String agama,
    String kelamin,
    String tanggallahir,
    String tempatlahir,
    String alamat,
    String notelpon,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nis", datanis);
      preferences.setString("nama_siswa", nama);
      preferences.setString("foto", foto);
      preferences.setString("agama", agama);
      preferences.setString("kelamin", kelamin);
      preferences.setString("tanggal_lahir", tanggallahir);
      preferences.setString("tempat_lahir", tempatlahir);
      preferences.setString("alamat", alamat);
      preferences.setString("no_telpon", notelpon);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      loginStatus = value == 1 ? LoginStatus.login : LoginStatus.tidaklogin;
    });
  }

  keluar() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.setInt("value", null);
      preferences.commit();
      loginStatus = LoginStatus.tidaklogin;
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (loginStatus) {
      case LoginStatus.tidaklogin:
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: <Widget>[
                Positioned(
                  width: 500,
                  child: Image.asset(
                    "assets/img/labschool.jpg",
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 32,
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 190,
                  child: Container(
                    padding: EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(62),
                            topRight: Radius.circular(62))),
                    child: Form(
                      key: key,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Silahkan masukkan NIS anda";
                                }
                              },
                              onSaved: (e) => nis = e,
                              decoration: InputDecoration(
                                hintText: 'NIS',
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 16, bottom: 62),
                            child: TextFormField(
                                validator: (e) {
                                  if (e.isEmpty) {
                                    return "Silahkan masukkan password anda";
                                  }
                                },
                                onSaved: (e) => password = e,
                                obscureText: secureText,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                      onPressed: showHide,
                                      icon: Icon(secureText
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              check();
                            },
                            child: Container(
                              height: 50,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32)),
                              ),
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case LoginStatus.login:
        return HomePage(keluar);
        break;
    }
  }
}
