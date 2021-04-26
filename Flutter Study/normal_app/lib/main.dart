
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

main() => runApp(MyAPP());
List<CameraDescription> cameras;
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
        title: Text("webview_flutter"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                tooltip: "搜索",
                onPressed: () {
                  print("搜索");
                  _webViewController.evaluateJavascript("flutterCallJsMethod('Flutter通过JS修改')");
                },
            ),
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

      initialUrl: 'https://cofdev.csmc-cloud.com/marchevapp/727evapp.html',
      // initialUrl: 'https://akamai.wwwqa.brandap.ford.com/content/cx727/cn/zh_cn/user.html',
      // initialUrl: 'https://wwwdev.fafc.cnps.dealerconnection.com.cn/cashier/v1/demoPc/home.html',
      // initialUrl: 'https://dsl.apps.pp01.cneast.cf.ford.com.cn/content/cx727/cn/zh_cn/model-select.html#model?t=91222211',
      // initialUrl: 'https://bcrystalest.github.io/flutterNative.html?t=222223111',
      // initialUrl: 'https://bcrystalest.github.io/flutterNative.html?t=222223111',
      gestureNavigationEnabled: true,
      userAgent: "channel/app",
      javascriptChannels: {
        JavascriptChannel(
          name:"sendPayMessage",
          onMessageReceived: (JavascriptMessage message){
            print("获取JS回传数据: ${message.message}");
            _showDialog(context);
          }
        )
      },
    );
  }
}

void _showDialog(BuildContext cxt){
  // showCupertinoModalPopup(context: cxt, builder: (cxt){
  //     var dialog = CupertinoActionSheet(
  //       title: Text('Plz Selete'),
  //       cancelButton: CupertinoActionSheetAction(onPressed: (){
  //         Navigator.pop(cxt,0);
  //       },
  //         child: Text("取消")),
  //       actions: [
  //         CupertinoActionSheetAction(onPressed: (){
  //           showImagePicker(1);
  //           Navigator.pop(cxt,1);
  //         }, child: Text('相机'))
  //       ],
  //       ),
  //     )
  //     return dialog;
  // });
  showCupertinoModalPopup<int>(context: cxt, builder:(cxt){
    var dialog =CupertinoActionSheet(
      title: Text("请选择"),
//        message: Text('上传作业!'),
      cancelButton: CupertinoActionSheetAction(onPressed: (){
        Navigator.pop(cxt,0);
      }, child: Text("取消")),
      actions: <Widget>[
        CupertinoActionSheetAction(onPressed: (){
          // showImagePicker(1);
          ImagePicker.pickImage(
            source: ImageSource.camera,

          );
          Navigator.pop(cxt,1);

        }, child: Text('相机')),

        CupertinoActionSheetAction(onPressed: (){
          ImagePicker.pickImage(
            source: ImageSource.gallery,

          );
          Navigator.pop(cxt,2);
        }, child: Text('相册')),
      ],
    );
    return dialog;
  });

  showImagePicker(type) async{
    // Specifies the source where the picked image should come from.
    // enum ImageSource {
    //   // 这个是调用源码
    // // Opens up the device camera, letting the user to take a new picture.
    // camera,
    //
    // // Opens the user's photo gallery.
    // gallery,
    // };
    var image = await ImagePicker.pickImage(source: type ==1?ImageSource.camera: ImageSource.gallery);
    // 枚举类型 设置调用的类型camera 相机  另外一个是本地相册
    // setState(() {
    // _image = image;
    // });

  }
}


