import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pickle_ball/common/widgets/text_form_field.dart';
import 'package:pickle_ball/utils/assets_utils.dart';
import 'package:pickle_ball/utils/color_utils.dart';
import 'package:pickle_ball/views/find_tournament/widgets/item_competition_format_widget.dart';
import 'package:pickle_ball/providers/campaign_provider.dart';

class CompetitionFormatView extends ConsumerWidget {
  final int campaignId;

  const CompetitionFormatView({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorUtils.primaryBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 20).r,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final campaignAsyncValue =
                      ref.watch(campaignProvider(campaignId));
                  return campaignAsyncValue.when(
                    data: (tournaments) {
                      return Wrap(
                        children: tournaments.map((tournament) {
                          return ItemCompetitionFormatWidget(
                            tournament: tournament,
                          );
                        }).toList(),
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stack) => Text('Error: $error'),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.insert_comment_outlined,
                          color: ColorUtils.blueColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Comments (34)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorUtils.greenColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const TextFormFieldCustomWidget(
                      hint: 'Write down your comment',
                      maxLine: 5,
                      inputAction: TextInputAction.done,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50)),
                            child: Image.asset(
                              AssetUtils.imgSignIn,
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: TextFormFieldCustomWidget(
                              label: 'Trần Quân',
                              hint: 'Write down your comment',
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
