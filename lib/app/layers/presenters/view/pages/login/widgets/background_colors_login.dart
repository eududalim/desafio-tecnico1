import 'package:flutter/material.dart';

class BackgroundColorsLogin extends StatelessWidget {
  const BackgroundColorsLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.blue[200]!.withOpacity(0.6),
        Colors.deepPurple[200]!.withOpacity(0.6),
      ])),
    );
  }
}
