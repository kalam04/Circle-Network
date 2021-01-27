
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'mainDrawer.dart';

class FTV extends StatefulWidget {
  @override
  _FTVState createState() => _FTVState();
}

class _FTVState extends State<FTV> {
  final Completer<InAppWebViewController> _controller = Completer<InAppWebViewController>();

  Future<bool> _willPopCallback() async {
    InAppWebViewController webViewController = await _controller.future;
    bool canNavigate = await webViewController.canGoBack();
    if (canNavigate) {
      webViewController.goBack();
      return false;
    } else {
      return true;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _willPopCallback();
  }

  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var x=MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
          appBar: new AppBar(title: Center(
              child: Text('FTP Server', style: TextStyle(fontSize: x / 30),)),
            centerTitle: true,
            leadingWidth: 0,
            backgroundColor: Color(0xffFF7F50),),
          body: SafeArea(
            child: InAppWebView(
              initialUrl: "http://ftp4.circleftp.net/",
              initialHeaders: {},
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                    debuggingEnabled: true,
                    useOnDownloadStart: true
                ),
              ),
              onWebViewCreated: (InAppWebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onLoadStart: (InAppWebViewController controller, String url) {},
              onLoadStop: (InAppWebViewController controller, String url) {},
              onDownloadStart: (controller, url) async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
                // print("onDownloadStart $url");
                // final taskId = await FlutterDownloader.enqueue(
                //
                //   url: url,
                //   savedDir: await ExtStorage.getExternalStoragePublicDirectory(
                //       ExtStorage.DIRECTORY_DOWNLOADS),
                //   //savedDir: (await getExternalStorageDirectory()).path,
                //   showNotification: true, // show download progress in status bar (for Android)
                //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                // );
              },
            ),
          ),
          drawer: SafeArea(child: mainDrawer()),


        ),
      );
    }else{
      return WillPopScope(
        onWillPop: _willPopCallback,
        child: Scaffold(
          appBar: new AppBar(title: Center(
              child: Text('FTP Server', style: TextStyle(fontSize: w / 30),)),
            centerTitle: true,
            leadingWidth: 0,
            backgroundColor: Color(0xffFF7F50),),
          body: SafeArea(
            child: InAppWebView(
              initialUrl: "http://ftp4.circleftp.net/",
              initialHeaders: {},
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                    debuggingEnabled: true,
                    useOnDownloadStart: true
                ),
              ),
              onWebViewCreated: (InAppWebViewController webViewController) {
                _controller.complete(webViewController);
              },
              onLoadStart: (InAppWebViewController controller, String url) {},
              onLoadStop: (InAppWebViewController controller, String url) {},
              onDownloadStart: (controller, url) async {
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
                // print("onDownloadStart $url");
                // final taskId = await FlutterDownloader.enqueue(
                //
                //   url: url,
                //   savedDir: await ExtStorage.getExternalStoragePublicDirectory(
                //       ExtStorage.DIRECTORY_DOWNLOADS),
                //   //savedDir: (await getExternalStorageDirectory()).path,
                //   showNotification: true, // show download progress in status bar (for Android)
                //   openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                // );
              },
            ),
          ),
          drawer: SafeArea(child: mainDrawer()),


        ),
      );
    }
  }
}