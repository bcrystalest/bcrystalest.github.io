
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


main() => runApp(MyAPP());

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageApp(),
    );
  }
}
WebViewController _webViewController;
class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                tooltip: "搜索",
                onPressed: () {
                  print("搜索");
                  _webViewController.evaluateJavascript("flutterCallJsMethod('Flutter通过JS修改')");
                },
            ),
          ]
      ),
      body: HomaPageContentBody(),
    );
  }
}

class HomaPageContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:WebViewExample(),
    );

  }

}

class LeftElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.focused) && !states.contains(MaterialState.pressed)) {
            //获取焦点时的颜色
            return Colors.blue;
          } else if (states.contains(MaterialState.pressed)) {
            //按下时的颜色
            return Colors.deepPurple;
          }//默认状态使用灰色
          return Colors.grey;
        }),
      ),
      child: Text("-"),
      onPressed: () {
        print("object");
      },
    );
  }
}



class nativeToFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      onWebViewCreated: (WebViewController controller) {
        _webViewController = controller;
      },
      javascriptMode: JavascriptMode.unrestricted,
      // initialUrl: 'https://wwwdev.fafc.cnps.dealerconnection.com.cn/cashier/v1/demoPc/home.html',
      // initialUrl: 'https://dsl.apps.pp01.cneast.cf.ford.com.cn/content/cx727/cn/zh_cn/model-select.html#model?t=91222211',
      initialUrl: 'https://bcrystalest.github.io/flutterNative.html?t=222223111',
      gestureNavigationEnabled: true,
      userAgent: "channel/app",
      javascriptChannels: {
        JavascriptChannel(
          name:"sendPayMessage",
          onMessageReceived: (JavascriptMessage message){
            print("获取JS回传数据: ${message.message}");
          }
        )
      },
    );
  }
}



