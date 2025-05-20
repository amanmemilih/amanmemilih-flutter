///
/// generate_recovery_phrase_screen.dart
/// lib/features/auth/presentation/screens
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/resources/colors.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/touchable_opacity_widget.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/args/generate_recovery_phrase_args.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/args/register_recovery_key_args.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/generaterecoverykey/generate_recovery_key_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenerateRecoveryKeyScreen extends StatelessWidget {
  const GenerateRecoveryKeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as GenerateRecoveryKeyArgs;

    return BlocProvider(
      create: (context) =>
          getIt<GenerateRecoveryKeyCubit>()..getData(args.username),
      child: GenerateRecoveryKeyScreenImplement(),
    );
  }
}

class GenerateRecoveryKeyScreenImplement extends StatelessWidget {
  const GenerateRecoveryKeyScreenImplement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as GenerateRecoveryKeyArgs;

    return BlocConsumer<GenerateRecoveryKeyCubit, GenerateRecoveryKeyState>(
      listener: (context, state) {
        if (state.status == GenerateRecoveryKeyStatus.error) {
          alertError(
            context,
            () {},
            title: state.error?.title ?? 'Unknown Error',
            message: // later
                state.error?.message ?? 'Error Message Not Assigned',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: SvgPicture.asset(
              "assets/svg/logo.svg",
              width: 159.w,
              height: 13.h,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Atur kode recovery",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const Text(
                    "Simpan kode ini ditempat yang aman, dan hanya anda yang bisa mengaksesnya.",
                  ),
                  SizedBox(height: 16.h),
                  state.status == GenerateRecoveryKeyStatus.success
                      ? Column(
                          children: [
                            GridView.count(
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 2,
                              childAspectRatio: 3.8,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 24,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: const NeverScrollableScrollPhysics(),
                              children: state.recoveryKey
                                  .map(
                                    (e) => Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      height: 386.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: BaseColors.primary),
                                      ),
                                      child: Semantics(
                                        identifier:
                                            "text_recovery_key_${state.recoveryKey.indexOf(e) + 1}",
                                        child: Text(e),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            SizedBox(height: 20.h),
                            TouchableOpacityWidget(
                              onTap: context
                                  .read<GenerateRecoveryKeyCubit>()
                                  .copyToClipBoard,
                              child: Semantics(
                                identifier: "button_copy_recovery_key",
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.copy,
                                      color: BaseColors.primary,
                                    ),
                                    Text(
                                      "Salin Teks",
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: BaseColors.primary,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 100.w),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: BaseColors.primary,
                            ),
                          ),
                        ),
                  SizedBox(height: 16.h),
                  Semantics(
                    identifier: "button_next",
                    child: AMElevatedButton(
                        title: "Selanjutnya",
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            ROUTER.registerRecoveryKey,
                            arguments: RegisterRecoveryKeyArgs(
                              username: args.username,
                              password: args.password,
                              passwordConfirmation: args.passwordConfirmation,
                              key: state.data!,
                            ),
                          );
                        }),
                  ),
                  const SizedBox(height: 21)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
