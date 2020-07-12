import 'package:flutter/material.dart';
import 'package:tab_layout/custom_views/widget/normal_button.dart';
import 'package:tab_layout/modules/bottom_tab_main.dart';
import 'package:tab_layout/modules/bottom_tab_main_slider.dart';

import 'modules/top_tab_screen_main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tab layout',
      home: MyHomePage(title: 'Tab Layout'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            NormalButton(
             title: 'Top Screen',
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>TopScreen()));
              },
            ),
            SizedBox(height: 30,),
            NormalButton(
              title: 'Bottom Screen',
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BottomScreen()));
              },
            ),
            SizedBox(height: 30,),
            NormalButton(
              title: 'Bottom Screen With Slider ',
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>BottomSliderScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
