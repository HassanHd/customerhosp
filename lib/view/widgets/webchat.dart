import 'dart:io';

import 'package:customerapp/constant.dart';
import 'package:customerapp/view/screens/bottom_nav/HomeTapScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'custom_text.dart';
class InAppchat extends StatefulWidget {


  @override
  _InAppchatState createState() => _InAppchatState();

}

class _InAppchatState extends State<InAppchat> {

  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: textblue,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,

            title: CustomText(
              text: "Chat",
              color: black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: primarydarkcolor,
                size: 35,
              ),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeTapScreen()),
                        (Route<dynamic> route) => false);
              },
            ),
          ),
          body: SafeArea(
              child: Column(children: <Widget>[

                Expanded(
                  child: Stack(
                    children: [
                      InAppWebView(
                        key: webViewKey,
                        initialUrlRequest:
                        URLRequest(url: Uri.parse("https://chatting.page/elmostashfa")),
                        initialOptions: options,
                        pullToRefreshController: pullToRefreshController,
                        onWebViewCreated: (controller) {
                          webViewController = controller;
                        },
                        onLoadStart: (controller, url) {
                          setState(() {
                            this.url = url.toString();
                            urlController.text = this.url;
                          });
                        },
                        androidOnPermissionRequest: (controller, origin, resources) async {
                          return PermissionRequestResponse(
                              resources: resources,
                              action: PermissionRequestResponseAction.GRANT);
                        },
                        shouldOverrideUrlLoading: (controller, navigationAction) async {
                          var uri = navigationAction.request.url!;
                          //
                          // if (![ "http", "https", "file", "chrome",
                          //   "data", "javascript", "about"].contains(uri.scheme)) {
                          //   if (await canLaunch(url)) {
                          //     // Launch the App
                          //     await launch(
                          //       url,
                          //     );
                          //     // and cancel the request
                          //     return NavigationActionPolicy.CANCEL;
                          //   }
                          // }

                          return NavigationActionPolicy.ALLOW;
                        },
                        onLoadStop: (controller, url) async {
                          pullToRefreshController.endRefreshing();
                          setState(() {
                            this.url = url.toString();
                            urlController.text = this.url;
                          });
                        },
                        onLoadError: (controller, url, code, message) {
                          pullToRefreshController.endRefreshing();
                        },
                        onProgressChanged: (controller, progress) {
                          if (progress == 100) {
                            pullToRefreshController.endRefreshing();
                          }
                          setState(() {
                            this.progress = progress / 100;
                            urlController.text = this.url;
                          });
                        },
                        onUpdateVisitedHistory: (controller, url, androidIsReload) {
                          setState(() {
                            this.url = url.toString();
                            urlController.text = this.url;
                          });
                        },
                        onConsoleMessage: (controller, consoleMessage) {
                          print(consoleMessage);
                        },
                      ),
                      progress < 1.0
                          ? LinearProgressIndicator(value: progress)
                          : Container(),
                    ],
                  ),
                ),

              ]))),
    );
  }
}
