import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/models/news_model.dart';

class ItemNewsWidget extends StatelessWidget {
  final NewsModel news;

  const ItemNewsWidget({
    super.key,
    required this.news,
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
            child: news.imageUrl != null
                ? Image.network(
                    news.imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      AssetUtils.imgSignIn,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  )
                : Image.asset(
                    AssetUtils.imgSignIn,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  news.newsTitle,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  news.newsContent,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 20),
                // Row(
                //   children: [
                //     const Icon(Icons.remove_red_eye_outlined, size: 15),
                //     const SizedBox(width: 3),
                //     Text(news.id.toString()),
                //     const SizedBox(width: 30),
                //     const Icon(Icons.person_2_outlined, size: 15),
                //     const SizedBox(width: 3),
                //     Text(news.newsType.toString()),
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
