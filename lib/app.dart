import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/locale.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/utils/scroll_behaviour_utils.dart';
import 'package:amanmemilih_mobile_app/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:amanmemilih_mobile_app/feature/document_information/presentation/document_information_screen.dart';
import 'package:amanmemilih_mobile_app/feature/edit_image/presentation/edit_image_screen.dart';
import 'package:amanmemilih_mobile_app/feature/form_details/presentation/form_detail_screen.dart';
import 'package:amanmemilih_mobile_app/feature/login/presentation/login_screen.dart';
import 'package:amanmemilih_mobile_app/feature/main/component/bloc/navigation_cubit.dart';
import 'package:amanmemilih_mobile_app/feature/main/component/presentation/bottom_navigation_bar.dart';
import 'package:amanmemilih_mobile_app/feature/recovery_key/presentation/recovery_key_screen.dart';
import 'package:amanmemilih_mobile_app/feature/register_password/presentation/register_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NavigationCubit()),
          ],
          child: MaterialApp(
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
            initialRoute: ROUTER.bottomNavBar,
            routes: {
              ROUTER.splash: (context) => const SplashScreen(),
              // ROUTER.profile: (context) => const profileScreen(),

              // Rifqi
              ROUTER.login: (context) => const LoginScreen(),
              ROUTER.registerPassword: (context) =>
                  const RegisterPasswordScreen(),

              // Aaron
              ROUTER.recoveryKey: (context) => const RecoveryKeyScreen(),

              // Yazid & Indra, please go to detail AMBottomNavigationBar to see detail jobs
              ROUTER.dashboard: (context) => const DashboardScreen(),
              ROUTER.bottomNavBar: (context) => AMBottomNavigationBar(),

              // Wildan
              ROUTER.editImageScreen: (context) => const EditImageScreen(),

              // Reinhard
              ROUTER.documentInformation: (context) =>
                  const DocumentInformationScreen(),
              ROUTER.detailForm: (context) => const FormDetailScreen(),
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
          ),
        );
      },
    );
  }
}
