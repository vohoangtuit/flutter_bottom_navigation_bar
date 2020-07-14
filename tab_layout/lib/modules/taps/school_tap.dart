import 'package:flutter/material.dart';

class SchoolTap extends StatefulWidget {
  @override
  _SchoolTapState createState() => _SchoolTapState();
}

class _SchoolTapState extends State<SchoolTap> with AutomaticKeepAliveClientMixin<SchoolTap>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.green,
          ),
          itemCount: 30,
          itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("School $index", style: TextStyle(color: Colors.amber, fontSize: 17),)
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
