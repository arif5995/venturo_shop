import 'package:get_it/get_it.dart';
import 'package:venturo_shop/datasource/dio_helper.dart';
import 'package:venturo_shop/utils/navigation/navigation_helper.dart';
import 'package:venturo_shop/utils/navigation/router/home_router.dart';

final sl = GetIt.instance;
class Injections {
  Future<void> initialize() async {
    sl.registerLazySingleton<RemoteApi>(() => RemoteApiImpl());
    sl.registerLazySingleton<NavigationHelper>(() => NavigationHelperImpl());
    sl.registerLazySingleton<HomeRouter>(() => HomeRouterImpl(navigationHelper: sl()));
  }
}