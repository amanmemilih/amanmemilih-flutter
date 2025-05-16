import 'package:amanmemilih_mobile_app/core/components/alerts/alert_error.dart';
import 'package:amanmemilih_mobile_app/core/constants/colors.dart';
import 'package:amanmemilih_mobile_app/core/resources/colors.dart';
import 'package:amanmemilih_mobile_app/core/widgets/elevated_button.dart';
import 'package:amanmemilih_mobile_app/features/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/cubits/deletedocument/delete_document_cubit.dart';
import 'package:amanmemilih_mobile_app/features/document/presentation/cubits/documentdetail/document_detail_cubit.dart';
import 'package:amanmemilih_mobile_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentDetailScreen extends StatelessWidget {
  const DocumentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    late final Map args;
    if (routeArgs is Map) {
      args = routeArgs;
    } else {
      // Jika arguments tidak sesuai, tampilkan error UI
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Formulir'),
          backgroundColor: colorPrimary,
        ),
        body: const Center(
          child: Text('Terjadi kesalahan: arguments tidak valid.'),
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DocumentDetailCubit>()
            ..getData(args['electionType'], args['id']),
        ),
        BlocProvider(
          create: (context) => getIt<DeleteDocumentCubit>(),
        ),
      ],
      child: DocumentDetailScreenImplement(),
    );
  }
}

class DocumentDetailScreenImplement extends StatelessWidget {
  const DocumentDetailScreenImplement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    late final Map args;
    if (routeArgs is Map) {
      args = routeArgs;
    } else {
      // Jika arguments tidak sesuai, tampilkan error UI
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Formulir'),
          backgroundColor: colorPrimary,
        ),
        body: const Center(
          child: Text('Terjadi kesalahan: arguments tidak valid.'),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(35.h),
        child: AppBar(
          backgroundColor: colorPrimary,
          foregroundColor: Colors.white,
          title: Text(
            "Detail Formulir",
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: BlocConsumer<DocumentDetailCubit, DocumentDetailState>(
        listener: (context, state) {
          if (state.status == DocumentDetailStatus.error) {
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
          // print('Dokumen gambar: ${state.data?.documents}');
          if ((state.status == DocumentDetailStatus.success ||
                  state.status == DocumentDetailStatus.submitting) &&
              state.data != null) {
            return Container(
              margin: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Detail Formulir",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                      padding: const EdgeInsets.all(16),
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
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Formulir Pemilihan"),
                              Text(state.data?.electionType ?? '-'),
                            ],
                          ),
                          SizedBox(height: 5.h),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, authState) {
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Kelurahan"),
                                      Text(
                                          authState.credential?.user?.village ??
                                              '-'),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Kecamatan"),
                                      Text(authState
                                              .credential?.user?.subdistrict ??
                                          '-'),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Kab/Kota"),
                                      Text(authState
                                              .credential?.user?.district ??
                                          '-'),
                                    ],
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Provinsi"),
                                      Text(authState
                                              .credential?.user?.province ??
                                          '-'),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                          SizedBox(height: 10.h),
                          (state.data?.electionType == 'PILPRES' &&
                                  state.data?.votes != null)
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Hasil Rekapitulasi Suara",
                                      style: GoogleFonts.plusJakartaSans(
                                        color: const Color(0xff3A3A3A),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                      ),
                                    ),
                                    ...state.data!.votes!.map(
                                      (e) {
                                        return Padding(
                                          padding: EdgeInsets.only(top: 5.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${e.candidatNo ?? '-'} ${e.candidatName ?? ''}",
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  color:
                                                      const Color(0xff3A3A3A),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(
                                                "${e.totalVotes ?? '-'}",
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                  color:
                                                      const Color(0xff3A3A3A),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Foto Formulir",
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    if (state.data?.documents != null &&
                        state.data!.documents!.isNotEmpty)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var i = 0;
                                i < state.data!.documents!.length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    state.data!.documents![i],
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        width: double.infinity,
                                        height: 200,
                                        child: const Center(
                                          child: Text(
                                            'Gambar tidak tersedia',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      );
                                    },
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    else
                      const Text('Tidak ada foto formulir.'),
                    SizedBox(height: 10.h),
                    state.data!.status == 1
                        ? Container()
                        : AMElevatedButton(
                            title: "Verifikasi",
                            isLoading:
                                state.status == DocumentDetailStatus.submitting,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext innerContext) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.red[100],
                                          radius: 24,
                                          child: Icon(
                                            Icons.help_outline,
                                            size: 32,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          "Setelah data diverifikasi, anda tidak dapat mengubahnya lagi. Lanjutkan?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(height: 24),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<DocumentDetailCubit>()
                                                    .documentVerification(
                                                        args['electionType'],
                                                        args['id']);
                                                context
                                                    .read<DocumentDetailCubit>()
                                                    .getData(
                                                        args['electionType'],
                                                        args['id']);
                                                Navigator.pop(context);
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text(
                                                "Yes",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: Colors.red,
                                                side: BorderSide(
                                                    color: Colors.red),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              child: Text("No"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                    BlocListener<DeleteDocumentCubit, DeleteDocumentState>(
                      listener: (context, state) {
                        if (state.status == DeleteDocumentStatus.error) {
                          alertError(
                            context,
                            () {},
                            title: state.error?.title ?? 'Unknown Error',
                            message: // later
                                state.error?.message ??
                                    'Error Message Not Assigned',
                          );
                        }

                        if (state.status == DeleteDocumentStatus.success) {
                          if (context.mounted) {
                            Future.microtask(() {
                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            });
                          }
                        }
                      },
                      child: Container(
                        child: state.data!.status == 1
                            ? Container()
                            : Column(
                                children: [
                                  SizedBox(height: 20),
                                  AMElevatedButton(
                                    backgroundColor:
                                        BaseColors.primary.withAlpha(153),
                                    title: "Hapus",
                                    isLoading: state.status ==
                                        DocumentDetailStatus.submitting,
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext innerContext) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 24,
                                                    vertical: 16),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Colors.red[100],
                                                  radius: 24,
                                                  child: Icon(
                                                    Icons.help_outline,
                                                    size: 32,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                SizedBox(height: 16),
                                                Text(
                                                  "Setelah data dihapus, anda tidak dapat mengubahnya lagi. Lanjutkan?",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                                SizedBox(height: 24),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                DeleteDocumentCubit>()
                                                            .deleteDocument(
                                                                args[
                                                                    'electionType'],
                                                                args['id']);
                                                        Navigator.pop(context);
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            Colors.red,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      child: Text(
                                                        "Yes",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    OutlinedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: OutlinedButton
                                                          .styleFrom(
                                                        foregroundColor:
                                                            Colors.red,
                                                        side: BorderSide(
                                                            color: Colors.red),
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                      child: Text("No"),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
