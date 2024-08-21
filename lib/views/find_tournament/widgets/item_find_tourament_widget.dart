import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/views/find_tournament/views/find_tournament_detail_view.dart';
import 'package:pickle_ball/views/find_tournament/widgets/item_header_widget.dart';

class ItemFindTouramentWidget extends StatelessWidget {
  const ItemFindTouramentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const FindTournamentDetailView()),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: ColorUtils.grayColor.withOpacity(.3),
                blurRadius: 3,
                spreadRadius: 3),
          ],
        ),
        child: const ItemHeaderWidget(),
      ),
    );
  }
}
