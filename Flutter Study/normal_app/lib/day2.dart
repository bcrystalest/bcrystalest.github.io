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

// class HomepageBodyContent extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child:
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Checkbox(value: true, onChanged: (value){
//             print(value);
//           }),
//           Text("data2",style: TextStyle(fontSize: 20),)
//         ],
//       )
//     );
//   }
// }




class HomepageBodyContent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomepageContentbodyState();
  }
}

class HomepageContentbodyState extends State<HomepageBodyContent>{
  var flagValue = true;
  @override
  Widget build(BuildContext context) {
    return Center(
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox
              (
                value: flagValue,
                onChanged: (value)
                {
                  print(flagValue);
                  setState(() {
                    flagValue = value;
                  });

                }
            ),
            Text("data2",style: TextStyle(fontSize: 20),)
          ],
        )
    );
  }
}