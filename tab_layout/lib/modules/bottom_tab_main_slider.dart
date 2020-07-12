import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_layout/custom_views/app_color.dart';
import 'package:tab_layout/modules/taps/business_tap.dart';
import 'package:tab_layout/modules/taps/home_tap.dart';
import 'package:tab_layout/modules/taps/profile_tap.dart';
import 'package:tab_layout/modules/taps/school_tap.dart';

/// This Widget is the main application widget.
class BottomSliderScreen extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: BottomSliderWidget(),
    );
  }
}

class BottomSliderWidget extends StatefulWidget {
  BottomSliderWidget({Key key}) : super(key: key);


  @override
  _BottomSliderWidgetState createState() => _BottomSliderWidgetState();
}

class _BottomSliderWidgetState extends State<BottomSliderWidget> {
   List<BottomNavigationBarItem> bottomTab() {
     return [
       BottomNavigationBarItem(
           icon: Icon(CupertinoIcons.home),
           title: Text('Home')
       ),
       BottomNavigationBarItem(
           icon: Icon(Icons.business),
           title: Text('Business')
       ),
       BottomNavigationBarItem(
           icon: Icon(Icons.school),
           title: Text('School')
       ),
       BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
       ),

     ];

  }
  int currentIndex=0;

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
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
  @override
  void initState() {
    //currentPage = tabScreen[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   backgroundColor: Color.fromARGB(244, 245, 245, 1),
      appBar: AppBar(
        title: const Text('Tab layout bottom with slider'),
      ),
      body: buildPageView(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTab(),
        currentIndex: currentIndex,
        onTap: (index) {
          bottomTapped(index);
        },
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),

    );
  }
}