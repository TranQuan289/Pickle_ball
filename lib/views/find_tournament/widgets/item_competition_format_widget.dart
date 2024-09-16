import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/models/campaign_model.dart';
import 'package:pickle_ball/views/find_tournament/views/group_stage_view.dart';
import 'package:pickle_ball/views/find_tournament/views/tournament_view.dart';

class ItemCompetitionFormatWidget extends StatelessWidget {
  final Tournament tournament;

  const ItemCompetitionFormatWidget({
    super.key,
    required this.tournament,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (tournament.tournamentType == 'Elimination') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    TournamentView(tournamentId: tournament.tournamentId ?? 0)),
          );
        } else if (tournament.tournamentType == 'GroupStage') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GroupStageView()),
          );
        }
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
                child: Image.network(
                  tournament.imageUrl ?? AssetUtils.imgSignIn,
                  height: 130.h,
                  width: 130.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AssetUtils.imgSignIn,
                      height: 130.h,
                      width: 130.w,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tournament.tournamentName ?? 'Unnamed Tournament',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                '${tournament.formatType ?? 'N/A'} | ${tournament.tournamentType ?? 'N/A'} | Rank ${tournament.rank ?? 'N/A'}',
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
