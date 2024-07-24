import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';

class Navigation extends StatelessWidget {

  Navigation({required this.home, required this.health, required this.user});

  final String home;
  final String health;
  final String user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RawMaterialButton(
            onPressed: (){},
            child: Column(
              children: <Widget>[
                Icon(CupertinoIcons.square_fill, color: Colors.grey),
                Text(home),
              ],
            ),
          ),
          RawMaterialButton(
            onPressed: (){},
            child: Column(
              children: <Widget>[
                Icon(CupertinoIcons.square_fill, color: Colors.grey),
                Text(health),
              ],
            ),
          ),
          RawMaterialButton(
            onPressed: (){},
            child: Column(
              children: <Widget>[
                Icon(CupertinoIcons.square_fill, color: Colors.grey,),
                Text(user),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
