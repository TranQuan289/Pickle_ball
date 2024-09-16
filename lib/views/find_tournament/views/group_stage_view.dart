import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';

class GroupStageView extends ConsumerWidget {
  const GroupStageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: ScreenUtil().screenHeight / 2,
              width: ScreenUtil().screenWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetUtils.imgGroupStage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
