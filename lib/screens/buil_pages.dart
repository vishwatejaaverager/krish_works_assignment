import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Gallery extends StatelessWidget {
  final int index;
  const Gallery({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (builder) {
      if (index == 0) {
        return WebView(
          initialUrl: "https://krishworks.com/gallery/",
        );
      } else {
        return WebView(
          initialUrl: "https://krishworks.com/contact/",
        );
      }
    });
  }
}
