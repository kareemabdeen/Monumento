import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monumento/application/popular_monuments/monument_3d_model/monument_3d_model_bloc.dart';
import 'package:monumento/presentation/popular_monuments/mobile/widgets/popular_monument_view_mobile_app_bar.dart';
import 'package:monumento/presentation/popular_monuments/mobile/widgets/populat_monuments_view_body_mobile.dart';
import 'package:monumento/presentation/popular_monuments/mobile/widgets/scan_monuments_screen.dart';
import 'package:monumento/service_locator.dart';
import 'package:monumento/utils/app_colors.dart';
import 'package:monumento/utils/app_text_styles.dart';

class PopularMonumentsViewMobile extends StatelessWidget {
  const PopularMonumentsViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Monument3dModelBloc>(
      create: (context) => locator<Monument3dModelBloc>()
        ..add(
          const ViewMonument3DModel(
            monumentName: "Mount Rushmore National Memorial",
          ),
        ),
      lazy:
          true, //* Default is true; initializes the object only when it's needed.

      child: Scaffold(
        appBar: PopularMonumnetsViewMobileAppBar(),
        body: PopularMonumentsViewMobileBodyBlocBuilder(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ScanMonumentsScreen()));
          },
          label: Text(
            "Scan Monuments",
            style: AppTextStyles.textStyle(
                fontType: FontType.MEDIUM, size: 14, isBody: true),
          ),
          backgroundColor: AppColor.appPrimary,
          extendedPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
