import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://radio.smklabor.sch.id',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
