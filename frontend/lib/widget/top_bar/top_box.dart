// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/widget/top_bar/top_bar_details.dart';

class TopBox extends StatelessWidget {
  const TopBox({super.key});

  @override
  Widget build(BuildContext context) {
    double topBoxWidth = MediaQuery.of(context).size.width;
    List topBarDatas = [
      {"title": "New Subscribers", "data": "4,095", "change": 33.45},
      {"title": "Streams", "data": "47,457", "change": -158.65},
      {"title": "Engagements", "data": "20.58", "change": 65.55},
      {"title": "Avg.watch time", "data": "85,4", "change": 6.55},
    ];
    return Container(
      height: 180,
      width: topBoxWidth > 1430 ? topBoxWidth - 531 : 900,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MainTheme().boxColor.withOpacity(0.2),
            MainTheme().boxColor,
            MainTheme().boxColor.withOpacity(0.2),
          ],
        ),
        border: Border.all(color: MainTheme().boxBorderColor, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TopBarDetails(
            title: topBarDatas[0]['title'],
            data: topBarDatas[0]['data'],
            change: topBarDatas[0]['change'],
          ),
          Container(width: 1, color: MainTheme().primaryColor, height: 100),
          TopBarDetails(
            title: topBarDatas[1]['title'],
            data: topBarDatas[1]['data'],
            change: topBarDatas[1]['change'],
          ),

          Container(width: 1, color: MainTheme().primaryColor, height: 100),

          TopBarDetails(
            title: topBarDatas[2]['title'],
            data: topBarDatas[2]['data'],
            change: topBarDatas[2]['change'],
          ),

          Container(width: 1, color: MainTheme().primaryColor, height: 100),

          TopBarDetails(
            title: topBarDatas[3]['title'],
            data: topBarDatas[3]['data'],
            change: topBarDatas[3]['change'],
          ),
        ],
      ),
    );
  }
}
