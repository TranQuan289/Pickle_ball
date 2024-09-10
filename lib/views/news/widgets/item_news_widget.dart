import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';

class ItemNewsWidget extends StatelessWidget {
  const ItemNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              AssetUtils.imgSignIn,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Pickle Ball Tournament',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Rounds and Knockout | Pickle Ball',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 15,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('12'),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.person_2_outlined,
                      size: 15,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text('12'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
