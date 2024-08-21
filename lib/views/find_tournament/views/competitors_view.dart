import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/views/find_tournament/widgets/item_competitors_widget.dart';

class CompetitorsView extends ConsumerWidget {
  const CompetitorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ItemCompetitorsWidget();
          },
        ),
      ),
    );
  }
}
