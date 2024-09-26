import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/models/round_model.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/providers/round_provider.dart';
import 'package:pickle_ball/views/find_tournament/views/tournament_view.dart';

class GroupStageView extends ConsumerWidget {
  final int tournamentId;

  const GroupStageView({super.key, required this.tournamentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roundsAsyncValue = ref.watch(roundsProvider(tournamentId));
    final teamsAsyncValue = ref.watch(teamsProvider(tournamentId));

    return Scaffold(
      backgroundColor: ColorUtils.primaryBackgroundColor,
      body: Stack(
        children: [
          // Background image
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
          // Content
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: 20),
                roundsAsyncValue.when(
                  data: (rounds) {
                    final firstRound = rounds.isNotEmpty ? rounds.first : null;
                    return teamsAsyncValue.when(
                      data: (teamGroups) {
                        if (teamGroups.isEmpty) {
                          return const Text('No groups available');
                        }
                        final firstGroup = teamGroups.entries.first;
                        return Column(
                          children: [
                            if (firstRound != null &&
                                firstRound.roundStatus == "Completed")
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => TournamentView(
                                              tournamentId: tournamentId),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF1244A2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text("Next Match"),
                                  ),
                                ),
                              ),
                            _buildGroupTable(firstGroup.key, firstGroup.value),
                          ],
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, _) => Text('Error: $error'),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, _) => Text('Error: $error'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupTable(String groupName, List<TeamGroup> teams) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1244A2), Color(0xFF062764)],
        ),
        border: Border.all(color: const Color(0xFFC6C61A), width: 0.4),
      ),
      child: Table(
        border: TableBorder.all(color: const Color(0xFFC6C61A)),
        columnWidths: const {
          0: FlexColumnWidth(5),
          1: FlexColumnWidth(1),
        },
        children: [
          TableRow(
            children: [
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Group $groupName',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('W - L',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          ...teams.map((team) => TableRow(
                children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(team.teamName,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('${team.wins} - ${team.losses}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
