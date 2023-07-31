import 'package:venturo_shop/utils/navigation/navigation_helper.dart';
import 'package:venturo_shop/utils/navigation/router/app_router.dart';

abstract class HomeRouter {
  void navigateHome();

  void navigateToSignUp();
}

class HomeRouterImpl implements HomeRouter{
  final NavigationHelper navigationHelper;

  HomeRouterImpl({required this.navigationHelper});
  @override
  void navigateHome() {
    navigationHelper.pushNamedAndRemoveUntil(AppRouter.home);
  }

  @override
  void navigateToSignUp() {
    // TODO: implement navigateToSignUp
  }

}