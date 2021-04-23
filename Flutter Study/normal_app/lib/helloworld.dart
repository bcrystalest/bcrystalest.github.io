import 'package:flutter/material.dart';

main() => runApp(HomePageWidget());

class HomePageWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ScaffoldWidget()
    );
  }
}

class ScaffoldWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("323"),
      ),
      body: HomepageBodyContent(),
    );
  }
}

class HomepageBodyContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Text(
        "hello world",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 29,
            color: Colors.red
        ),
      ),
    );
  }
}
