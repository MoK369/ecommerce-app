import 'package:ecommerce/presentation/core/routes/defined_routes/defined_routes.dart';
import 'package:ecommerce/presentation/core/routes/route_generator/route_generator.dart';
import 'package:ecommerce/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'di.dart';

Future<void> main() async {
  FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  configureDependencies();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        Size designSize = (orientation == Orientation.portrait)
            ? const Size(430, 932)
            : const Size(932, 430);
        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            theme: AppThemes.lightTheme,
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            title: 'E-commerce Application',
            onGenerateRoute: RouteGenerator.generateRoute,
            initialRoute: DefinedRoutes.logInScreenRouteName,
          ),
        );
      },
    );
  }
}
