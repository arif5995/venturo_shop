import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:venturo_shop/Page/bloc/menus_cubit.dart';
import 'package:venturo_shop/Page/ui/home_screen.dart';
import 'package:venturo_shop/injections.dart';
import 'package:venturo_shop/utils/navigation/navigation_helper.dart';
import 'package:venturo_shop/utils/navigation/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injections().initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (__, _) => MaterialApp(
          title: "Venturo Shop",
          theme: ThemeData(
              primaryColor: Colors.white,
              canvasColor: Colors.transparent,
              bottomSheetTheme:
                  const BottomSheetThemeData(backgroundColor: Colors.white)),
          color: Colors.white,
          home: BlocProvider(
            create: (context) => MenusCubit(remoteApi: sl())..getDataMenu(),
            child: HomeScreen(),
          ),
          navigatorKey: NavigationHelperImpl.navigationKey,
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case AppRouter.home:
                return MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (context) =>
                        MenusCubit(remoteApi: sl())..getDataMenu(),
                    child: HomeScreen(),
                  ),
                );
            }
          }),
    );
  }
}
