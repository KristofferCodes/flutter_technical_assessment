import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_technical_assessment/features/login/login.dart';
import 'package:flutter_technical_assessment/utils/constants.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  static const Color myPrimaryColor = AppConst.yellow;
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MaterialColor myPrimarySwatch =
        MaterialColor(myPrimaryColor.value, <int, Color>{
      50: myPrimaryColor.withOpacity(0.1),
      100: myPrimaryColor.withOpacity(0.2),
      200: myPrimaryColor.withOpacity(0.3),
      300: myPrimaryColor.withOpacity(0.4),
      400: myPrimaryColor.withOpacity(0.5),
      500: myPrimaryColor.withOpacity(0.6),
      600: myPrimaryColor.withOpacity(0.7),
      700: myPrimaryColor.withOpacity(0.8),
      800: myPrimaryColor.withOpacity(0.9),
      900: myPrimaryColor.withOpacity(1.0),
    });
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 825),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: myPrimarySwatch,
              fontFamily: 'Satoshi',
            ),
            home: const LoginPage(),
          );
        });
  }
}
