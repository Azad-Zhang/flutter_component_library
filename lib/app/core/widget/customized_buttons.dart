import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';


class CustomizedButton extends StatelessWidget {
  CustomizedButton({required this.icon, required this.text, required this.onPressed});
  final IconData icon;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: (){
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            SizedBox(
              width: ScreenAdapter.width(8),
            ),
            Text(text),
          ],
        ),
      constraints: BoxConstraints.tightFor(
        width: ScreenAdapter.width(125),
        height: ScreenAdapter.height(40)
      ),
      //fillColor: Colors.white,
    );
  }
}
