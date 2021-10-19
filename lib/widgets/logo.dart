import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          width: 80,
          height: 80,
          child: Image(
            image: AssetImage('assets/images/logo.jpeg'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'UENR',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
              color: Colors.blue,
              shadows: [
                Shadow(
                  color: Colors.black,
                  blurRadius: 4,
                  offset: Offset(3, 2),
                )
              ]),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
