///
/// forgot_recovery_key_screen.dart
/// lib/features/auth/presentation/screens
///
/// Created by Indra Mahesa https://github.com/zinct
///
library;

import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/errors/errors.dart';
import 'package:amanmemilih_mobile_app/core/resources/colors.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/text_field.dart';
import 'package:amanmemilih_mobile_app/core/widgets/touchable_opacity_widget.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/forgotpassword/forgot_password_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: ForgotPasswordImplement(),
    );
  }
}

class ForgotPasswordImplement extends StatelessWidget {
  const ForgotPasswordImplement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state.status == ForgotPasswordStatus.error) {
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

        if (state.status == ForgotPasswordStatus.success) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        final cubit = context.read<ForgotPasswordCubit>();

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lupa Password",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  const Text(
                    "Simpan kode ini ditempat yang aman, dan hanya anda yang bisa mengaksesnya.",
                  ),
                  SizedBox(height: 10.h),
                  Semantics(
                    identifier: "button_toggle_key_visibility",
                    child: TouchableOpacityWidget(
                      onTap: () {
                        context.read<ForgotPasswordCubit>().toggleHiddenKey();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 3.w),
                          Text(
                            !state.isKeyHidden ? "Sembunyikan" : "Perlihatkan",
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
                  ),
                  SizedBox(height: 10.h),
                  Column(
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
                              child: Semantics(
                                identifier: "input_recovery_key_${index + 1}",
                                child: TextField(
                                  controller: controllers[index],
                                  obscureText: state.isKeyHidden,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                  Form(
                    key: context.read<ForgotPasswordCubit>().formKey,
                    child: Column(
                      children: [
                        Semantics(
                          identifier: "input_new_password",
                          child: AMTextField(
                            controller: context
                                .read<ForgotPasswordCubit>()
                                .passwordController,
                            hint: "Password",
                            isPassword: true,
                            obsecureText: !state.isPasswordHidden,
                            onPasswordHiddenTap: context
                                .read<ForgotPasswordCubit>()
                                .toggleHiddenPassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field ini tidak boleh kosong!';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Semantics(
                          identifier: "input_confirm_new_password",
                          child: AMTextField(
                            controller: context
                                .read<ForgotPasswordCubit>()
                                .passwordConfirmationController,
                            hint: "Konfirmasi Password",
                            isPassword: true,
                            obsecureText: !state.isPasswordConfirmationHidden,
                            onPasswordHiddenTap: context
                                .read<ForgotPasswordCubit>()
                                .toggleHiddenPasswordConfirmation,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Field ini tidak boleh kosong!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Semantics(
                    identifier: "button_reset_password",
                    child: AMElevatedButton(
                      title: "Reset Password",
                      isLoading: state.status == ForgotPasswordStatus.loading,
                      onTap: () {
                        if (context
                            .read<ForgotPasswordCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<ForgotPasswordCubit>().forgotPassword();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
