import 'package:flutter/material.dart';
import 'package:seventh_flutter_app/app/layers/presenters/controllers/auth_controller.dart';
import 'package:seventh_flutter_app/app/layers/presenters/controllers/auth_state.dart';
import 'package:seventh_flutter_app/app/layers/presenters/controllers/home_controller.dart';
import 'package:seventh_flutter_app/app/layers/presenters/view/commons_widgets/container_center_simple.dart';
import 'package:seventh_flutter_app/app/layers/presenters/view/pages/home/widgets/video_player.dart';
import 'package:seventh_flutter_app/app/shared/dependency_injection/dependency_injection.dart';

import '../../../../domain/models/video_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var authController = inject.get<AuthController>();
  final homeController = inject.get<HomeController>();

  @override
  void initState() {
    // verifica se o estado de autenticação é de erro.
    // Caso não seja, inicializa video.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authController.state.value.state != AuthState.error) {
        homeController.getVideo();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    authController.state.addListener(() {
      if (authController.state.value.state == AuthState.error) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<VideoModel>(
        valueListenable: homeController.video,
        builder: (context, value, _) {
          if (value is VideoLoading) {
            return const Center(
              child: BoxCardCenterSimple(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (value is VideoSuccess) {
            return Align(child: VideoPlayerHome(value.urlVideo));
          }
          return Container();
        },
      ),
    );
  }
}
