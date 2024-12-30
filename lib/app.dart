import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/locale.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/utils/scroll_behaviour_utils.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/screens/generate_recovery_key_screen.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/screens/register_recovery_key_screen.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/screens/document_information_screen.dart';
import 'package:amanmemilih_mobile_app/features/camera/presentation/screens/edit_image_screen.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/form_detail_screen.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/screens/document_recapitulation_screen.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/screens/document_validation_screen.dart';
import 'package:amanmemilih_mobile_app/features/intro/presentation/screens/splash_screen.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/screens/login_screen.dart';
import 'package:amanmemilih_mobile_app/features/main/component/bloc/navigation_cubit.dart';
import 'package:amanmemilih_mobile_app/features/main/component/presentation/bottom_navigation_bar.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/screens/register_password_screen.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
            BlocProvider(
              create: (context) => getIt<AuthCubit>()..checkCredential(),
            ),
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
            initialRoute: ROUTER.splash,
            routes: {
              // Intro
              ROUTER.splash: (context) => const SplashScreen(),
              // Auth
              ROUTER.login: (context) => const LoginScreen(),
              ROUTER.registerPassword: (context) =>
                  const RegisterPasswordScreen(),
              ROUTER.generateRecoveryKey: (context) =>
                  const GenerateRecoveryKeyScreen(),
              ROUTER.registerRecoveryKey: (context) =>
                  const RegisterRecoveryKeyScreen(),
              ROUTER.forgotPassword: (context) => const ForgotPasswordScreen(),
              // Main
              ROUTER.bottomNavBar: (context) => AMBottomNavigationBar(),
              // Camera
              ROUTER.editImageScreen: (context) => const EditImageScreen(),
              // Document
              ROUTER.documentInformation: (context) =>
                  const DocumentInformationScreen(),
              ROUTER.documentValidation: (context) =>
                  const DocumentValidationScreen(),
              ROUTER.documentRecapitulation: (context) =>
                  const DocumentRecapitulationScreen(),
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
