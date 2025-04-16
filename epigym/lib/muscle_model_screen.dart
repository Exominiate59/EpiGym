import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MuscleModelScreen extends StatefulWidget {
  @override
  _MuscleModelScreenState createState() => _MuscleModelScreenState();
}

class _MuscleModelScreenState extends State<MuscleModelScreen> {
  late WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Modèle 3D - Muscles")),
      body: WebView(
        initialUrl: "file:///android_asset/human_3d.html",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        javascriptChannels: {
          JavascriptChannel(
            name: 'Flutter',
            onMessageReceived: (JavascriptMessage message) {
              _handleMuscleClick(message.message);
            },
          ),
        },
      ),
    );
  }

  void _handleMuscleClick(String muscle) {
    // Ici tu peux rediriger vers les exercices associés
    print("Muscle cliqué: $muscle");
  }
}
