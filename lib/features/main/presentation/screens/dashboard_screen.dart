import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/extensions/int_extension.dart';
import 'package:amanmemilih_mobile_app/core/widgets/outlined_button.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:amanmemilih_mobile_app/features/main/presentation/cubits/dashboard/dashboard_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DashboardCubit>()..getData(),
      child: DashboardScreenImplement(),
    );
  }
}

class DashboardScreenImplement extends StatelessWidget {
  const DashboardScreenImplement({
    super.key,
  });

  Widget _cardInformationDocument(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF535308).withAlpha(13),
                  offset: const Offset(0, 24),
                  blurRadius: 50,
                  spreadRadius: 0,
                ),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informasi Dokumen",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: const Color(0xff3A3A3A),
                ),
              ),
              SizedBox(height: 5.h),
              state.status == DashboardStatus.loading
                  ? const Center(child: CircularProgressIndicator())
                  : BlocBuilder<DashboardCubit, DashboardState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Belum Unggah",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff5E5F60),
                                  ),
                                ),
                                Text(
                                  "${state.data?.notUploaded.preventNull()} Dokumen",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: const Color(0xff3F3F3F),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Terunggah",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff5E5F60),
                                  ),
                                ),
                                Text(
                                  "${state.data?.uploaded.preventNull()} Dokumen",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: colorYellow,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Terverifikasi",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: const Color(0xff5E5F60),
                                  ),
                                ),
                                Text(
                                  "${state.data?.verified.preventNull()} Dokumen",
                                  style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: colorGreen,
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ),
              SizedBox(height: 15.h),
              AMOutlinedButton(
                title: "Detail",
                onTap: () =>
                    Navigator.pushNamed(context, ROUTER.documentInformation),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _cardInformationTPS(context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informasi TPS",
                style: GoogleFonts.plusJakartaSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: const Color(0xff3A3A3A),
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 340.w,
                    height: 72.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffFFF5E6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "TPS",
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: const Color(0xff3A3A3A),
                          ),
                        ),
                        Text(
                          "12",
                          style: GoogleFonts.plusJakartaSans(
                            fontWeight: FontWeight.w700,
                            color: colorPrimary,
                            fontSize: 41,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 340.w,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFF5E6),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colorPrimary.withAlpha(13),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kecamatan",
                              style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xff3A3A3A),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              state.credential?.user?.subdistrict ?? '',
                              style: GoogleFonts.plusJakartaSans(
                                color: colorPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        width: 340.w,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFF5E6),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colorPrimary.withAlpha(13),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Kabupaten/Kota",
                              style: GoogleFonts.plusJakartaSans(
                                color: const Color(0xff3A3A3A),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              state.credential?.user?.district ?? '',
                              style: GoogleFonts.plusJakartaSans(
                                color: colorPrimary,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffFFF5E6),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colorPrimary.withAlpha(13),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Provinsi",
                      style: GoogleFonts.plusJakartaSans(
                        color: const Color(0xff3A3A3A),
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      state.credential?.user?.province ?? '',
                      style: GoogleFonts.plusJakartaSans(
                        color: colorPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.w),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPage,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 120.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(20),
                bottomStart: Radius.circular(20),
              ),
              color: colorPrimary,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(24, 34.h, 24, 24.h),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<DashboardCubit>().getData();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halo,",
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return Text(
                            state.credential?.user?.username ?? '',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10.h),
                      _cardInformationDocument(context),
                      SizedBox(height: 10.h),
                      _cardInformationTPS(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
