import 'package:flutter/material.dart';
import 'package:tab_layout/modules/taps/business_tap.dart';
import 'package:tab_layout/modules/taps/home_tap.dart';
import 'package:tab_layout/modules/taps/profile_tap.dart';
import 'package:tab_layout/modules/taps/school_tap.dart';
import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';
/// This Widget is the main application widget.
class BottomScreen extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: BottomWidget(),
    );
  }
}

class BottomWidget extends StatefulWidget {
  BottomWidget({Key key}) : super(key: key);


  @override
  _BottomWidgetState createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  List<BottomNavigationBarItem> bottomTab =[
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text('Home')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        title: Text('Business')
    ),
    BottomNavigationBarItem(
        //icon: Icon(Icons.school),
        icon: new Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            const Icon(Icons.school),
            new Positioned(
                top: -1.0,
                right: -6.0,
                  child: new Container(
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(8.0), color: Colors.red),
                    width: 16.0,
                    child: Center(
                      child: new Text(
                        "10",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
          ],
        ),

        title: Text('School')
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('Profile')
    ),

  ];

  final List tabScreen=[
    HomeTap(),
    BusinessTap(),
    SchoolTap(),
    ProfileTap(),
  ];

  int currentIndex=0;
  var currentPage;
  @override
  void initState() {
    currentPage = tabScreen[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 245, 245, 1),
      appBar: AppBar(
        title: const Text('Tab layout bottom'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTab,
        onTap: (index){
          setState(() {
            currentIndex=index;
            currentPage =tabScreen[currentIndex];
          });
        },
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
      ),
      body: currentPage,
    );
  }
}