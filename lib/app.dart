import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/locale.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/utils/scroll_behaviour_utils.dart';
import 'package:amanmemilih_mobile_app/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:amanmemilih_mobile_app/feature/login/presentation/login_screen.dart';
import 'package:amanmemilih_mobile_app/feature/recovery_key/presentation/recovery_key_screen.dart';
import 'package:amanmemilih_mobile_app/feature/register_password/presentation/register_password_screen.dart';
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
          initialRoute: ROUTER.dashboard,
          routes: {
            ROUTER.login: (context) => const LoginScreen(),
            ROUTER.splash: (context) => const SplashScreen(),
            ROUTER.recoveryKey: (context) => const RecoveryKeyScreen(),
            ROUTER.registerPassword: (context) =>
                const RegisterPasswordScreen(),
            ROUTER.dashboard: (context) => const DashboardScreen(),
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
              primary: colorPrimary,
            ),
          ),
        );
      },
    );
  }
}
