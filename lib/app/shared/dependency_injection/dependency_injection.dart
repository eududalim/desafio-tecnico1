import 'package:get_it/get_it.dart';
import '../../layers/data/datasources/seventh_api/seventh_api_datasource.dart';
import '../../layers/data/repositories/home_repository_impl.dart';
import '../../layers/data/repositories/login_repository_impl.dart';
import '../../layers/domain/repositories/home_repository_abst.dart';
import '../../layers/domain/repositories/login_repository_abst.dart';
import '../../layers/presenters/controllers/login_controller.dart';

import '../../layers/presenters/controllers/auth_controller.dart';
import '../../layers/presenters/controllers/home_controller.dart';

GetIt inject = GetIt.I;

initInject() {
// datasources
  inject.registerLazySingleton<SeventhApiDatasource>(
      () => SeventhApiDatasource());

//repositories
  inject.registerLazySingleton<LoginRepositoryAbst>(
      () => LoginRepositoryImpl(inject()));
  inject.registerLazySingleton<HomeRepositoryAbst>(
      () => HomeRepositoryImpl(inject()));

// controllers
  inject.registerLazySingleton<LoginController>(
      () => LoginController(inject(), inject()));
  inject.registerLazySingleton<AuthController>(() => AuthController(
        inject(),
      ));
  inject.registerLazySingleton<HomeController>(() => HomeController(
        inject(),
      ));
}
