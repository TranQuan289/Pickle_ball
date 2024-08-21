import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/views/find_tournament/widgets/item_schedule_widget.dart';

class ScheduleView extends ConsumerWidget {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Match Schedule',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.sp,
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ItemScheduleWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
