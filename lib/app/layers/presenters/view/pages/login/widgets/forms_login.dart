import 'package:flutter/material.dart';
import 'package:seventh_flutter_app/app/layers/presenters/controllers/login_controller.dart';
import 'package:seventh_flutter_app/app/shared/dependency_injection/dependency_injection.dart';

import 'text_field.dart';

class FormsLogin extends StatelessWidget {
  const FormsLogin(
      {super.key,
      required this.enabledFields,
      required this.usernameController,
      required this.passwordController});

  final bool enabledFields;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    final loginController = inject.get<LoginController>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20),
        TextFieldLogin(
          controller: usernameController,
          text: 'Usuário',
          autofillHints: const [AutofillHints.username],
          enabled: enabledFields,
          validator: (input) =>
              ((input != null && input.isNotEmpty) ? null : 'Insira usuário'),
          prefixIcon: const Icon(Icons.person_outline_sharp),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder(
            valueListenable: loginController.obscurePassword,
            builder: (context, value, _) {
              return TextFieldLogin(
                controller: passwordController,
                text: 'Senha',
                enabled: enabledFields,
                validator: (input) => ((input != null && input.isNotEmpty)
                    ? null
                    : 'Insira senha'),
                autofillHints: const [AutofillHints.password],
                obscureText: value,
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                    onPressed: loginController.setObscurePassword,
                    icon: Icon(value == true
                        ? Icons.visibility
                        : Icons.visibility_off)),
              );
            }),
      ],
    );
  }
}
