import 'package:flutter/material.dart';
import 'package:seventh_flutter_app/app/shared/dependency_injection/dependency_injection.dart';

import '../../../../../../shared/theme/colors_theme_const.dart';
import '../../../../controllers/login_controller.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      color: themeBlueLight1.withOpacity(1),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        focusColor: Colors.blueAccent.withOpacity(0.3),
        splashColor: Colors.deepPurple.withOpacity(0.2),
        hoverColor: Colors.blueAccent.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          child: Text(
            'Entrar',
            style: text5,
          ),
        ),
      ),
    );
  }
}
