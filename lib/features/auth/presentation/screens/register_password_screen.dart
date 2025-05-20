import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/text_field.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/args/generate_recovery_phrase_args.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/registerpassword/register_password_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPasswordScreen extends StatelessWidget {
  const RegisterPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterPasswordCubit>(),
      child: RegisterPasswordScreenImplement(),
    );
  }
}

class RegisterPasswordScreenImplement extends StatelessWidget {
  const RegisterPasswordScreenImplement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/svg/logo.svg",
          width: 159.w,
          height: 13.h,
        ),
      ),
      body: Form(
        key: context.read<RegisterPasswordCubit>().formKey,
        child: Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          child: BlocBuilder<RegisterPasswordCubit, RegisterPasswordState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selamat Datang",
                    textAlign: TextAlign.end,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const Text(
                    "Tambahkan password agar anda bisa mengakses fitur pada AmanMemilih",
                  ),
                  SizedBox(height: 12.h),
                  Semantics(
                    identifier: "input_password",
                    child: AMTextField(
                      controller: context
                          .read<RegisterPasswordCubit>()
                          .passwordController,
                      hint: "Password",
                      isPassword: true,
                      onPasswordHiddenTap: context
                          .read<RegisterPasswordCubit>()
                          .toggleHiddenPassword,
                      obsecureText: state.isPasswordHidden,
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
                    identifier: "input_confirm_password",
                    child: AMTextField(
                      controller: context
                          .read<RegisterPasswordCubit>()
                          .passwordConfirmationController,
                      hint: "Konfirmasi Password",
                      isPassword: true,
                      onPasswordHiddenTap: context
                          .read<RegisterPasswordCubit>()
                          .toggleHiddenPasswordConfirmation,
                      obsecureText: state.isPasswordConfirmationHidden,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Field ini tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Semantics(
                    identifier: "button_continue",
                    child: AMElevatedButton(
                      title: "Lanjut",
                      onTap: () {
                        if (context
                            .read<RegisterPasswordCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          Navigator.of(context).pushNamed(
                            ROUTER.generateRecoveryKey,
                            arguments: GenerateRecoveryKeyArgs(
                              username: username,
                              password: context
                                  .read<RegisterPasswordCubit>()
                                  .passwordController
                                  .text,
                              passwordConfirmation: context
                                  .read<RegisterPasswordCubit>()
                                  .passwordConfirmationController
                                  .text,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
