import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TourPage extends StatelessWidget {
  final String url;

  const TourPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ],
      ),
    );
  }
}
