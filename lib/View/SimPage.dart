import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SimPage extends StatefulWidget {
  @override
  _SimPageState createState() => _SimPageState();
}

class _SimPageState extends State<SimPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'http://sim.smklabor.sch.id',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
