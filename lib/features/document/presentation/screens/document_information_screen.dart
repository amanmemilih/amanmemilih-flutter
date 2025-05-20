import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/constants/router.dart';
import 'package:amanmemilih_mobile_app/core/resources/colors.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/cubits/documentinformation/document_information_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentInformationScreen extends StatelessWidget {
  const DocumentInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DocumentInformationCubit>()..getData(),
      child: DocumentInformationScreenImplement(),
    );
  }
}

class DocumentInformationScreenImplement extends StatelessWidget {
  const DocumentInformationScreenImplement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: AppBar(
          backgroundColor: colorPrimary,
          foregroundColor: Colors.white,
          title: Text(
            "Informasi Dokumen",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: BlocConsumer<DocumentInformationCubit, DocumentInformationState>(
        listener: (context, state) {
          if (state.status == DocumentInformationStatus.error) {
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
          if (state.status == DocumentInformationStatus.success) {
            return Container(
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.all(24),
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<DocumentInformationCubit>().getData();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...state.data!.map(
                        (e) => _cardInformation(
                          title: e.name,
                          subtitle: e.status == 0
                              ? "unuploaded"
                              : e.status == 1
                                  ? 'unverified'
                                  : 'verified',
                          status: e.status == 0
                              ? "unuploaded"
                              : e.status == 1
                                  ? 'unverified'
                                  : 'verified',
                          onTap: () async {
                            await Navigator.pushNamed(
                              context,
                              ROUTER.detailForm,
                              arguments: {
                                'id': e.id,
                                'electionType': e.electionType,
                              },
                            );
                            if (!context.mounted) return;
                            context.read<DocumentInformationCubit>().getData();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _cardInformation({
    String? title,
    String? subtitle,
    String status = "unuploaded",
    Function()? onTap,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 5.h),
      child: Semantics(
        identifier: "button_document_$status",
        child: ListTile(
          onTap: status == 'unuploaded' ? null : onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: Colors.black.withAlpha(20),
            ),
          ),
          title: Text(
            title ?? "Error",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: 15,
              color: const Color(0xff3A3A3A),
            ),
          ),
          subtitle: Text(
            subtitle ?? "Error",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: status == "verified"
                  ? colorGreen
                  : (status == "unverified" ? colorYellow : Colors.red),
            ),
          ),
          trailing: status == 'unuploaded'
              ? null
              : const Icon(
                  Icons.arrow_forward_ios,
                  size: 17,
                  color: BaseColors.primary,
                ),
        ),
      ),
    );
  }
}
