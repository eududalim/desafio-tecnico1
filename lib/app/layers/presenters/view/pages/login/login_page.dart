import 'package:flutter/material.dart';

import '../../../../../shared/dependency_injection/dependency_injection.dart';
import '../../../controllers/login_controller.dart';
import '../../../controllers/auth_state.dart';
import '../../../controllers/auth_controller.dart';
import '../../commons_widgets/container_center_simple.dart';
import '../../commons_widgets/snacks_bar.dart';
import 'widgets/forms_login.dart';
import 'widgets/background_colors_login.dart';
import 'widgets/button_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var enabledFields = true;
  var obscureText = true;

  final scaffoldKey = GlobalKey<ScaffoldMessengerState>();
  final formKey = GlobalKey<FormState>();

  final loginController = inject.get<LoginController>();
  final authController = inject.get<AuthController>();

  @override
  void initState() {
    authController.state.value.state = AuthState.initial;
    authController.state.addListener(() {
      if (authController.state.value.state == AuthState.success) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      }
      if (authController.state.value.state == AuthState.error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar(authController.state.value.messageError));
        authController.state.value.state = AuthState.initial;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: ValueListenableBuilder<Auth>(
          valueListenable: authController.state,
          builder: (context, value, child) {
            var isLoading = (value.state == AuthState.loading);
            enabledFields = !isLoading;
            return Stack(
              children: [
                const BackgroundColorsLogin(),
                BoxCardCenterSimple(
                  backgroundColor: Colors.white.withOpacity(0.4),
                  child: AutofillGroup(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 70,
                            alignment: Alignment.center,
                            child: Text(
                              'SEVENTH APP',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          FormsLogin(
                              enabledFields: enabledFields,
                              usernameController: usernameController,
                              passwordController: passwordController),
                          const SizedBox(height: 40),
                          ButtonLogin(
                            onTap: enabledFields
                                ? () {
                                    if (formKey.currentState!.validate()) {
                                      loginController.login(
                                          usernameController.text.trim(),
                                          passwordController.text.trim());
                                    }
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                isLoading
                    ? Container(
                        alignment: Alignment.center,
                        color: Colors.black38,
                        child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator()))
                    : const SizedBox()
              ],
            );
          }),
    );
  }
}
