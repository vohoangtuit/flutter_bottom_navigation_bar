import 'package:flutter/material.dart';
import 'package:tab_layout/modules/taps/business_tap.dart';
import 'package:tab_layout/modules/taps/home_tap.dart';
import 'package:tab_layout/modules/taps/profile_tap.dart';
import 'package:tab_layout/modules/taps/school_tap.dart';

class TopScreenWithSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: TopNavigationSlider(),
    );
  }
}

class TopNavigationSlider extends StatefulWidget {
  @override
  _TopNavigationSliderState createState() => _TopNavigationSliderState();
}

class _TopNavigationSliderState extends State<TopNavigationSlider> {
  List<BottomNavigationBarItem> bottomTab() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      BottomNavigationBarItem(
          icon: Icon(Icons.business), title: Text('Business')),
      BottomNavigationBarItem(
          // icon: Icon(Icons.school),
          icon: new Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              const Icon(Icons.school),
              new Positioned(
                top: -1.0,
                right: -6.0,
                child: new Container(
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(8.0),
                      color: Colors.red),
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
          title: Text('School')),
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TabBar Demo',
      home: new Scaffold(
        body: DefaultTabController(
            length: bottomTab().length,
            child: Scaffold(
                appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: Container(
                color: Colors.red,
                child: new SafeArea(
                  child: Column(
                    children: <Widget>[
                      new Expanded(child: new Container()),
                      new BottomNavigationBar(
                        type: BottomNavigationBarType.fixed,
                        items: bottomTab(),
                        currentIndex: currentIndex,
                        onTap: (index) {
                          bottomTapped(index);
                        },
                        backgroundColor: Colors.blue,
                        selectedItemColor: Colors.redAccent,
                        unselectedItemColor: Colors.black45,
                      ),
                    ],
                  ),
                ),
              ),
            ),
              body: buildPageView(),
            )
        ),
      ),
    );
  }

  int currentIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        HomeTap(),
        BusinessTap(),
        SchoolTap(),
        ProfileTap(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      currentIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
