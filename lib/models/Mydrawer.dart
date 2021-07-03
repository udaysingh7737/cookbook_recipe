import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(elevation:0.5,
      child: Column(
        children: [

          Container(
              child: Center(
                  child: Text("hello"))),
        ],
      ),
    );
  }
}
