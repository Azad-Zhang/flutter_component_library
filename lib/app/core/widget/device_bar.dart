import 'package:flutter/material.dart';
import 'package:flutter_component_library/app/services/screenAdapter.dart';

class DeviceBar extends StatelessWidget {

  DeviceBar({required this.device, required this.manual});

  final String device;
  final String manual;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: ScreenAdapter.height(120),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: ScreenAdapter.width(1)
          )
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: ScreenAdapter.width(1)
                )
              ),
            ),
            height: ScreenAdapter.height(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: (){},
                  child: Text(device)
                ),
                RawMaterialButton(
                  onPressed: () {},
                  child: Text(manual),
                ),
              ],
            ),
          ),
          Container(
            //child: Icon(Icons.crop_square, size: ScreenAdapter.fontSize(80), color: Colors.black54,)
          ),
        ],
      ),
    );
  }
}
