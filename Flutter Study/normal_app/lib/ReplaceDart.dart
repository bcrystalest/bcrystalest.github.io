import 'package:flutter/material.dart';

main() => runApp(MyAPP());

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageApp(),
    );
  }
}

class HomePageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品列表"),
      ),
      body: HomaPageContentBody(),
    );
  }
}


class HomaPageContentBody  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomaPageContentBodyState();
  }
}

class _HomaPageContentBodyState extends State<HomaPageContentBody > {
  int _bodycounter = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states){
                          if (states.contains(MaterialState.focused) &&
                              !states.contains(MaterialState.pressed)) {
                            //获取焦点时的颜色
                            return Colors.blue;
                          } else if (states.contains(MaterialState.pressed)) {
                            //按下时的颜色
                            return Colors.deepPurple;
                          }
                          //默认状态使用灰色
                          return Colors.grey;
                        }
                    ),
                  ),
                  child: Text("+"),
                  onPressed: () {
                    print("click +");
                  }),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.focused) && !states.contains(MaterialState.pressed)) {
                        //获取焦点时的颜色
                        return Colors.blue;
                      } else if (states.contains(MaterialState.pressed)) {
                        //按下时的颜色
                        return Colors.deepPurple;
                      }
                      //默认状态使用灰色
                      return Colors.grey;
                    }),
                  ),
                  child: Text("-"),
                  onPressed: (){
                    print("click -");
                  }),
            ],
          ),
          Text("当前计数：$_bodycounter"),
        ],
      ),
    );
  }

}

