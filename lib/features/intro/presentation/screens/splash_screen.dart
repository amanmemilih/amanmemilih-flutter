///
/// splash_screen.dart
/// lib/features/intro/presentation/screens
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/resources/colors.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        switch (state.status) {
          case AuthStatus.unauthenticated:
            Navigator.of(context).pushReplacementNamed(ROUTER.login);
            break;
          case AuthStatus.authenticated:
            Navigator.of(context).pushReplacementNamed(ROUTER.bottomNavBar);
            break;
          case AuthStatus.error:
            alertError(
              context,
              () {
                if (!context.mounted) return;
                Navigator.of(context).pushReplacementNamed(ROUTER.login);
              },
              title: state.error?.title ?? 'Unknown Error',
              message: state.error?.message ?? 'Error Message Not Assigned',
            );
            break;
          default:
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: BaseColors.primary,
        );
      },
    );
  }
}
