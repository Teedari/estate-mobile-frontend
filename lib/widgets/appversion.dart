import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('UENR ESTATE APP v.0.3.1',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
        ));
  }
}
