import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: Text(
          "Profil",
          style: GoogleFonts.plusJakartaSans(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x14000000),
                          offset: Offset(0, 8),
                          blurRadius: 55,
                          spreadRadius: 0,
                        ),
                      ]),
                  child: ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                    leading: ClipRRect(
                      child: CircleAvatar(
                        child: SvgPicture.asset("assets/svg/profile.svg"),
                      ),
                    ),
                    title: Text(
                      state.credential?.user?.username ?? '',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: const Color(0xff3A3A3A),
                      ),
                    ),
                    subtitle: Text(
                      state.credential?.user?.region ?? '',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: const Color(0xff9C9C9C),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 30.h),
            Text(
              "Akun",
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14000000),
                    offset: Offset(0, 8),
                    blurRadius: 55,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    leading: SvgPicture.asset("assets/svg/key.svg"),
                    title: const Text("Ubah Password"),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () =>
                        Navigator.pushNamed(context, ROUTER.changePassword),
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.05),
                    endIndent: 18,
                    indent: 18,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                    leading: SvgPicture.asset(
                      "assets/svg/profile.svg",
                      color: Colors.black,
                    ),
                    title: const Text("Ubah Foto Profil"),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () =>
                        Navigator.pushNamed(context, ROUTER.changeProfile),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.status == AuthStatus.unauthenticated) {
                  Navigator.of(context).pushReplacementNamed(ROUTER.login);
                }

                if (state.status == AuthStatus.error) {
                  alertError(
                    context,
                    () {},
                    title: state.error?.title ?? '',
                    message: state.error?.message ?? '',
                  );
                }
              },
              builder: (context, state) {
                return AMElevatedButton(
                  title: "Logout",
                  isLoading: state.status == AuthStatus.loading,
                  onTap: context.read<AuthCubit>().logout,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
