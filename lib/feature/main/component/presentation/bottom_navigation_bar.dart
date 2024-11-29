import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/feature/dashboard/presentation/dashboard_screen.dart';
import 'package:amanmemilih_mobile_app/feature/main/component/bloc/navigation_cubit.dart';
import 'package:amanmemilih_mobile_app/feature/profile/presentation/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AMBottomNavigationBar extends StatelessWidget {
  final PageController _listViewController = PageController(initialPage: 0);
  final List<Widget> _listView = const [
    DashboardScreen(),
    ProfileScreen(),
  ];

  AMBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          elevation: 0,
          onPressed: () {
            // Handle camera action
          },
          child: SvgPicture.asset(
            "assets/svg/scan.svg",
            height: 30,
          ),
        ),
        body: BlocBuilder<NavigationCubit, int>(
          builder: (context, state) {
            return PageView(
              controller: _listViewController,
              onPageChanged: (index) {
                context.read<NavigationCubit>().changeTab(index);
              },
              physics: const NeverScrollableScrollPhysics(),
              children: _listView,
            );
          },
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: BlocBuilder<NavigationCubit, int>(
            builder: (context, state) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.read<NavigationCubit>().changeTab(0);
                      _listViewController.jumpToPage(0);
                    },
                    icon: SvgPicture.asset(
                      state == 0
                          ? "assets/svg/active_home.svg"
                          : "assets/svg/home.svg",
                    ),
                  ),
                  Text(
                    "Scan",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: colorPrimary,
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.read<NavigationCubit>().changeTab(1);
                      _listViewController.jumpToPage(1);
                    },
                    icon: SvgPicture.asset(
                      state == 1
                          ? "assets/svg/active_provile.svg"
                          : "assets/svg/profile.svg",
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
