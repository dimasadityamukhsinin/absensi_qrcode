import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GobookPage extends StatefulWidget {
  @override
  _GobookPageState createState() => _GobookPageState();
}

class _GobookPageState extends State<GobookPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'http://gobook.smklabor.sch.id',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
