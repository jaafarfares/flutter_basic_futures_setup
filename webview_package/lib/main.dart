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
        primarySwatch: Colors.red,
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
        title: const Text('Web- View Example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 160,
                height: 130,
                child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.amber),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Google()),
                      );
                    },
                    child: Ink.image(
                        fit: BoxFit.fill,
                        image: const NetworkImage(
                            'https://media.wired.co.uk/photos/606da4ae938ecee6e930e9c3/master/w_1600%2Cc_limit/google-logo_2.jpg'))),
              ),
              const Spacer(),
              SizedBox(
                width: 160,
                height: 130,
                child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.red),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Youtube()),
                      );
                    },
                    child: Ink.image(
                        fit: BoxFit.fill,
                        image: const NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf5ZQkwSF6Wmb-iRrggVSqQETo1Dfm5LmZng&usqp=CAU'))),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 160,
                height: 130,
                child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Facebook()),
                      );
                    },
                    child: Ink.image(
                        fit: BoxFit.fill,
                        image: const NetworkImage(
                            'https://www.questionpro.com/blog/wp-content/uploads/2016/02/facebook-logo.jpg'))),
              ),
              const Spacer(),
              SizedBox(
                width: 160,
                height: 130,
                child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.pink),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Instagram()),
                      );
                    },
                    child: Ink.image(
                        fit: BoxFit.contain,
                        image: const NetworkImage(
                            'https://cdn.siasat.com/wp-content/uploads/2020/04/Instagram-.jpg'))),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
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
