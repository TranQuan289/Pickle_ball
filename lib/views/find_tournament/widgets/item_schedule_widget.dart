import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';

class ItemScheduleWidget extends StatelessWidget {
  const ItemScheduleWidget({
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "13",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.greenColor,
                  fontSize: 30,
                ),
              ),
              Text(
                '00',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorUtils.primaryColor,
                  fontSize: 25,
                ),
              )
            ],
          ),
          const Text('Monday, 01/07'),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Single",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  AssetUtils.imgSignIn,
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "vs",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorUtils.greenColor,
                    fontSize: 20,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  AssetUtils.imgSignIn,
                  height: 50.h,
                  width: 50.w,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Single",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
