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
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF1244A2), Color(0xFF062764)],
                    ),
                    border:
                        Border.all(color: const Color(0xFFC6C61A), width: 0.4),
                  ),
                  child: Table(
                    border: TableBorder.all(color: const Color(0xFFC6C61A)),
                    columnWidths: const {
                      0: FlexColumnWidth(5),
                      1: FlexColumnWidth(1),
                    },
                    children: const [
                      TableRow(
                        children: [
                          TableCell(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Group A',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)))),
                          TableCell(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('W - L',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)))),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Row 2, Column 1',
                                      style: TextStyle(color: Colors.white)))),
                          TableCell(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Row 2, Column 2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)))),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Row 3, Column 1',
                                      style: TextStyle(color: Colors.white)))),
                          TableCell(
                              child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Row 3, Column 2',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)))),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
