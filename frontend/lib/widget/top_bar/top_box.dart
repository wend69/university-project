// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart'; // Ensure this path is correct
import 'package:ok/api_service.dart';
import 'package:ok/widget/top_bar/top_bar_details.dart'; // Ensure this path is correct



class TopBox extends StatelessWidget {
  final AnalyticsRow liveData; // Solid link to API

  const TopBox({super.key, required this.liveData});

  @override
  Widget build(BuildContext context) {
    double topBoxWidth = MediaQuery.of(context).size.width;

    // Mapping API data to the UI list
    List topBarDatas = [
      {
        "title": "New Subscribers", 
        "data": liveData.newSubscribe.toString(), 
        "change": 33.45
      },
      {
        "title": "Streams", 
        "data": liveData.streams.toString(), 
        "change": -158.65
      },
      {
        "title": "Engagements", 
        "data": "${liveData.engagementRate}%", 
        "change": 65.55
      },
      {
        "title": "Avg.watch time", 
        "data": "${liveData.watchT}h", 
        "change": 6.55
      },
    ];

    return Container(
      height: 180,
      width: topBoxWidth > 1430 ? topBoxWidth - 531 : 900,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MainTheme.boxColor.withValues(alpha: 0.2),
            MainTheme.boxColor,
            MainTheme.boxColor.withValues(alpha: 0.2),
          ],
        ),
        border: Border.all(color: MainTheme.boxBorderColor, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TopBarDetails(
            title: topBarDatas[0]['title'],
            data: topBarDatas[0]['data'],
            change: topBarDatas[0]['change'],
          ),
          _divider(),
          TopBarDetails(
            title: topBarDatas[1]['title'],
            data: topBarDatas[1]['data'],
            change: topBarDatas[1]['change'],
          ),
          _divider(),
          TopBarDetails(
            title: topBarDatas[2]['title'],
            data: topBarDatas[2]['data'],
            change: topBarDatas[2]['change'],
          ),
          _divider(),
          TopBarDetails(
            title: topBarDatas[3]['title'],
            data: topBarDatas[3]['data'],
            change: topBarDatas[3]['change'],
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1, 
      color: MainTheme.primaryColor.withValues(alpha: 0.5), 
      height: 100
    );
  }
}
