import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WebView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebViewScreen(),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web- View Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Spacer(),
          TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.amber),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Google()),
                );
              },
              child: Text('Google', style: TextStyle(color: Colors.white))),
          Spacer(),
          TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.red),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Youtube()),
                );
              },
              child: Text(
                'Youtube',
                style: TextStyle(color: Colors.white),
              )),
          Spacer(),
          TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Facebook()),
                );
              },
              child: Text('Facebook', style: TextStyle(color: Colors.white))),
          Spacer(),
          TextButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.pink),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Instagram()),
                );
              },
              child: Text(
                'Instagram',
                style: TextStyle(color: Colors.white),
              )),
          Spacer(),
        ]),
      ),
    );
  }
}
/* WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ), */

class Google extends StatelessWidget {
  const Google({super.key});
  final String google_url = 'https://www.google.com';

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: google_url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

class Youtube extends StatelessWidget {
  const Youtube({super.key});
  final String youtube_url = 'https:/www.youtube.com';

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: youtube_url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

class Facebook extends StatelessWidget {
  const Facebook({super.key});
  final String facebook_url = 'https://www.facebook.com';

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: facebook_url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

class Instagram extends StatelessWidget {
  const Instagram({super.key});
  final String intagram_url = 'https://www.instagram.com/';

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: intagram_url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
