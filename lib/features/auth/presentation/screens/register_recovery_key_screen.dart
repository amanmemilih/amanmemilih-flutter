///
/// generate_recovery_phrase_screen.dart
/// lib/features/auth/presentation/screens
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/errors/errors.dart';
import 'package:amanmemilih_mobile_app/core/resources/colors.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/touchable_opacity_widget.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/args/register_recovery_key_args.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/registerrecoverykey/register_recovery_key_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterRecoveryKeyScreen extends StatelessWidget {
  const RegisterRecoveryKeyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RegisterRecoveryKeyArgs;

    return BlocProvider(
      create: (context) => getIt<RegisterRecoveryKeyCubit>()..getData(args.key),
      child: RegisterRecoveryKeyScreenImplement(),
    );
  }
}

class RegisterRecoveryKeyScreenImplement extends StatelessWidget {
  const RegisterRecoveryKeyScreenImplement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as RegisterRecoveryKeyArgs;

    return BlocConsumer<RegisterRecoveryKeyCubit, RegisterRecoveryKeyState>(
      listener: (context, state) {
        if (state.status == RegisterRecoveryKeyStatus.error) {
          switch (state.error?.failure) {
            case InvalidRegisterPhraseFailure():
              alertError(
                context,
                () {},
                title: state.error?.title ?? 'Unknown Error',
                message: // later
                    state.error?.message ?? 'Error Message Not Assigned',
              );
              break;
            default:
              alertError(
                context,
                () {},
                title: state.error?.title ?? 'Unknown Error',
                message: // later
                    state.error?.message ?? 'Error Message Not Assigned',
              );
          }
        }
        if (state.status == RegisterRecoveryKeyStatus.success) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        final cubit = context.read<RegisterRecoveryKeyCubit>();

        final controllers = [
          cubit.phrase1Controller,
          cubit.phrase2Controller,
          cubit.phrase3Controller,
          cubit.phrase4Controller,
          cubit.phrase5Controller,
          cubit.phrase6Controller,
          cubit.phrase7Controller,
          cubit.phrase8Controller,
          cubit.phrase9Controller,
          cubit.phrase10Controller,
          cubit.phrase11Controller,
          cubit.phrase12Controller,
        ];

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
                Expanded(
                  flex: 1,
                  child: Column(
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
                        children: List.generate(
                          12,
                          (index) {
                            return Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              height: 386.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: BaseColors.primary),
                              ),
                              child: TextField(
                                readOnly: controllers[index].text != '',
                                controller: controllers[index],
                                obscureText: state.isKeyHidden,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      SizedBox(height: 20.h),
                      TouchableOpacityWidget(
                        onTap: () {
                          context
                              .read<RegisterRecoveryKeyCubit>()
                              .toggleHiddenKey();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/${!state.isKeyHidden ? 'eye.svg' : 'eye_close.svg'}",
                              alignment: Alignment.centerLeft,
                              colorFilter: ColorFilter.mode(
                                BaseColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Text(
                              !state.isKeyHidden
                                  ? "Sembunyikan"
                                  : "Perlihatkan",
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: BaseColors.primary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                AMElevatedButton(
                    title: "Selanjutnya",
                    isLoading:
                        state.status == RegisterRecoveryKeyStatus.loading,
                    onTap: () {
                      context
                          .read<RegisterRecoveryKeyCubit>()
                          .register(args.username, args.password);
                    }),
                const SizedBox(height: 21)
              ],
            ),
          ),
        );
      },
    );
  }
}
