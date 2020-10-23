import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmbeddedMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215,
      child: WebView(
        initialUrl: Uri.dataFromString(
          '<html><body><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d62206.04005409677!2d77.61683905!3d12.97968585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1603287999342!5m2!1sen!2sin" allowfullscreen="" width="${MediaQuery.of(context).size.width - 15}" height="200" frameborder="0" style="border:0;" aria-hidden="false" tabindex="0"></iframe></body></html>',
          mimeType: 'text/html',
        ).toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
