import 'package:flutter/material.dart';

class BusinessTap extends StatelessWidget {
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
              child: Text("Business $index", style: TextStyle(color: Colors.redAccent, fontSize: 17),)
          ),
        ),
      ),
    );
  }
}
