import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/views/find_tournament/views/find_tournament_detail_view.dart';
import 'package:pickle_ball/views/find_tournament/widgets/item_header_widget.dart';
import 'package:pickle_ball/models/find_tournament_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pickle_ball/providers/campaign_registration_provider.dart';

class ItemFindTournamentWidget extends ConsumerWidget {
  final FindTournamentModel tournament;

  const ItemFindTournamentWidget({
    super.key,
    required this.tournament,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  FindTournamentDetailView(tournamentId: tournament.id)),
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
              spreadRadius: 3,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemHeaderWidget(tournament: tournament),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () => _showRegistrationDialog(context, ref),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[100],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Register', style: TextStyle(fontSize: 12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRegistrationDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Registration'),
          content: const Text('Do you want to register for this tournament?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Register'),
              onPressed: () {
                Navigator.of(context).pop();
                _registerForTournament(context, ref);
              },
            ),
          ],
        );
      },
    );
  }

  void _registerForTournament(BuildContext context, WidgetRef ref) async {
    final registrationService = ref.read(campaignRegistrationProvider);
    final registrationState =
        ref.read(campaignRegistrationStateProvider.notifier);

    registrationState.state = const AsyncValue.loading();

    try {
      final result =
          await registrationService.registerForCampaign(tournament.id);
      if (result) {
        registrationState.state = const AsyncValue.data(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
      } else {
        registrationState.state = const AsyncValue.data(false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('You have already registered for this tournament')),
        );
      }
    } catch (e) {
      registrationState.state = AsyncValue.error(e, StackTrace.current);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
