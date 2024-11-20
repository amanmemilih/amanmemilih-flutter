import 'package:amanmemilih_mobile_app/core/constants/locale.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/resources/colors.dart';
import 'package:amanmemilih_mobile_app/core/utils/scroll_behaviour_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:amanmemilih_mobile_app/feature/intro/presentation/splash_screen.dart';
import 'package:localization/localization.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(917, 412),
      builder: (context, child) {
        return MaterialApp(
          locale: LOCALE.indonesia,
          localizationsDelegates: [
            // delegate from flutter_localization
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // delegate from localization package.
            LocalJsonLocalization.delegate,
          ],
          supportedLocales: const [
            LOCALE.english,
            LOCALE.indonesia,
          ],
          initialRoute: ROUTER.splash,
          routes: {
            ROUTER.splash: (context) => const SplashScreen(),
          },
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: const ScrollBehaviourUtils(),
              child: child ?? Container(),
            );
          },
          theme: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: BaseColors.primary,
            ),
          ),
        );
      },
    );
  }
}
