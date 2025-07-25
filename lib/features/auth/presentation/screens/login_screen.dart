import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/errors/errors.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/outlined_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/text_button.dart';
import 'package:amanmemilih_mobile_app/core/widgets/text_field.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginCubit>(),
      child: LoginScreenImplement(),
    );
  }
}

class LoginScreenImplement extends StatelessWidget {
  const LoginScreenImplement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/svg/logo.svg",
          width: 159.w,
          height: 13.h,
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: context.read<LoginCubit>().formKey,
          child: Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            child: Column(
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
                  "Silahkan login menggunakan username dan password anda sebelumnya",
                ),
                SizedBox(height: 12.h),
                Semantics(
                  identifier: "username",
                  child: AMTextField(
                    controller: context.read<LoginCubit>().usernameController,
                    hint: "Username",
                    isPassword: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Field ini tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 8.h),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Semantics(
                      identifier: "password",
                      child: AMTextField(
                        controller:
                            context.read<LoginCubit>().passwordController,
                        hint: "Password",
                        isPassword: true,
                        obsecureText: state.isPasswordHidden,
                        onPasswordHiddenTap:
                            context.read<LoginCubit>().toggleHiddenPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Field ini tidak boleh kosong!';
                          }
                          return null;
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state.status == AuthStatus.authenticated) {
                      Navigator.of(context)
                          .pushReplacementNamed(ROUTER.bottomNavBar);
                    }

                    if (state.status == AuthStatus.error) {
                      switch (state.error?.failure) {
                        case InvalidLoginCredentialsFailure():
                          alertError(
                            context,
                            () {},
                            title: state.error?.title ?? 'Unknown Error',
                            message: state.error?.message ??
                                'Error Message Not Assigned',
                          );
                          break;
                        case UserNotRegisteredFailure():
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext innerContext) {
                              return BlocProvider.value(
                                value: BlocProvider.of<LoginCubit>(context),
                                child: Container(
                                  height: 150.h,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  margin:
                                      const EdgeInsets.fromLTRB(24, 26, 24, 21),
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Text(
                                        "Halo, ${context.read<LoginCubit>().usernameController.text}",
                                        style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "Selamat datang di AmanMemilih",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          letterSpacing: 0.36,
                                        ),
                                      ),
                                      Text(
                                        "sebelum melanjutkan, harap isi password anda terlebih dahulu",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          letterSpacing: 0.36,
                                        ),
                                      ),
                                      const SizedBox(height: 28),
                                      Semantics(
                                        identifier: "button_continue_register",
                                        child: AMElevatedButton(
                                          title: "Lanjut",
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                              ROUTER.registerPassword,
                                              arguments: context
                                                  .read<LoginCubit>()
                                                  .usernameController
                                                  .text,
                                            );
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Semantics(
                                        identifier: "button_cancel_register",
                                        child: AMOutlinedButton(
                                          title: "Batalkan",
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          break;
                        default:
                          alertError(
                            context,
                            () {},
                            title: state.error?.title ?? 'Unknown Error',
                            message: state.error?.message ??
                                'Error Message Not Assigned',
                          );
                      }
                    }
                  },
                  builder: (context, state) {
                    return Semantics(
                      identifier: "button_login",
                      child: AMElevatedButton(
                        title: "Masuk",
                        isLoading: state.status == AuthStatus.loading,
                        onTap: () {
                          if (context
                              .read<LoginCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context.read<AuthCubit>().login(
                                  context
                                      .read<LoginCubit>()
                                      .usernameController
                                      .text,
                                  context
                                      .read<LoginCubit>()
                                      .passwordController
                                      .text,
                                );
                          }
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 10.h),
                Semantics(
                  identifier: "button_forgot_password",
                  child: AMTextButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(ROUTER.forgotPassword);
                    },
                    title: "Lupa Password?",
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
