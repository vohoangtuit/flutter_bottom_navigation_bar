import 'package:flutter/material.dart';
import 'package:tab_layout/modules/taps/business_tap.dart';
import 'package:tab_layout/modules/taps/home_tap.dart';
import 'package:tab_layout/modules/taps/profile_tap.dart';
import 'package:tab_layout/modules/taps/school_tap.dart';

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TopNavigation(),
    );
  }
}

class TopNavigation extends StatefulWidget {
  @override
  _TopNavigationState createState() => _TopNavigationState();
}

class _TopNavigationState extends State<TopNavigation> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabBar Demo',
      home: new Scaffold(
        body: DefaultTabController(
            length: bottomTab.length,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  color: Colors.greenAccent,
                  child: new SafeArea(
                    child: Column(
                      children: <Widget>[
                        new Expanded(child: new Container()),
                        new BottomNavigationBar(
                          type: BottomNavigationBarType.fixed,
                          currentIndex: currentIndex,
                          items: bottomTab,
                          onTap: (index){
                            setState(() {
                              currentIndex=index;
                              currentPage =tabScreen[currentIndex];
                            });
                          },
                          backgroundColor: Colors.green,
                          selectedItemColor: Colors.black,
                          unselectedItemColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              body: currentPage,
            )
        ),
      ),
    );
  }

  int currentIndex = 0;

  final List tabScreen=[
    HomeTap(),
    BusinessTap(),
    SchoolTap(),
    ProfileTap(),
  ];
  var currentPage;
  @override
  void initState() {
    currentPage = tabScreen[currentIndex];
    super.initState();
  }
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
}
