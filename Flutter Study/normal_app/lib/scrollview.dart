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

class HomaPageContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HomaPageContentBodyItem("title1","desc1","https://bcrystalest.github.io/Material/tailuo.jpg"),
        HomaPageContentBodyItem("title2","desc2","https://bcrystalest.github.io/Material/saiwen.jpg"),
        HomaPageContentBodyItem("title3","desc3","https://bcrystalest.github.io/Material/jieke.jpg"),
      ],
    );
  }
}

class HomaPageContentBodyItem extends StatelessWidget {
  final String title;
  final String desc;
  final String imageURL;


  HomaPageContentBodyItem(this.title,this.desc,this.imageURL);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 80),
      decoration:  BoxDecoration(
          border: Border.all(
            width: 5,
            color: Colors.purple,
          )
      ),
      child:
      itemColumn(this.title,this.desc,this.imageURL),
    );
  }
}

class itemColumn extends StatelessWidget {
  final titleStyle = TextStyle(
    fontSize: 20,
    color: Colors.orange,
  );
  final descStyle = TextStyle(
    fontSize: 15,
    color: Colors.green,
  );
  final edgeBottom = SizedBox(height: 10,);
  final String title;
  final String desc;
  final String imageURL;

  itemColumn(this.title,this.desc,this.imageURL);
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        edgeBottom,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(this.title,style: titleStyle),
            Text(this.title,style: titleStyle),
            Text(this.title,style: titleStyle),
            Text(this.title,style: titleStyle),
          ],
        ),
        edgeBottom,
        Text(this.desc,style: descStyle,),
        edgeBottom,
        Image.network(this.imageURL),
      ],
    );
  }
}
