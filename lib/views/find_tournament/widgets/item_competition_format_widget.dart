import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';

class ItemCompetitionFormatWidget extends StatelessWidget {
  const ItemCompetitionFormatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: ColorUtils.grayColor.withOpacity(.3),
            blurRadius: 3,
            spreadRadius: 3,
          ),
        ],
      ),
      child: SizedBox(
        width: 130.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                AssetUtils.imgSignIn,
                height: 130.h,
                width: 130.w,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Single",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            const Text('Rounds and Knockout | Pickle Ball | Rinc275')
          ],
        ),
      ),
    );
  }
}
