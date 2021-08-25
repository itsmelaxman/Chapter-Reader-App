import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReaderScreen extends StatefulWidget {
  final ChapterID;
  ReaderScreen(this.ChapterID);

  @override
  _ReaderScreenState createState() => _ReaderScreenState();
}

late WebViewController _controller;

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter' + widget.ChapterID.toString()),
      ),
      body: WebView(
        initialUrl: 'about:blank',
        onWebViewCreated: (WebViewController webviewController) {
          _controller = webviewController;
          _loadHtmlChapter1();
        },
      ),
    );
  }
}

_loadHtmlChapter1() async {
  String filText = await rootBundle.loadString("assets/ch1.html");
  _controller.loadUrl(
    Uri.dataFromString(filText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString(),
  );
}

_loadHtmlChapter2() async {
  String filText = await rootBundle.loadString("assets/ch2.html");
  _controller.loadUrl(
    Uri.dataFromString(filText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString(),
  );
}
