// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart'; 
import 'package:ok/api_service.dart';
import 'package:ok/widget/top_bar/top_bar_details.dart'; 

class TopBox extends StatelessWidget {
  final AnalyticsRow liveData; 

  const TopBox({super.key, required this.liveData});

  @override
  Widget build(BuildContext context) {
    // Using screenWidth ensures it doesn't look messy on smaller windows
    double screenWidth = MediaQuery.of(context).size.width;

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
      // Fixed: Now stays 95% of the screen width regardless of 1430px limit
      width: screenWidth * 0.95, 
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF00FF88).withValues(alpha: 0.1), // Light Neon Green
            const Color(0xFF00FF88).withValues(alpha: 0.2), 
            const Color(0xFF00FF88).withValues(alpha: 0.1),
          ],
        ),
        // Subtle neon green border
        border: Border.all(
          color: const Color(0xFF00FF88).withValues(alpha: 0.4), 
          width: 1.5
        ),
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
      // Matching the divider to the neon green theme
      color: const Color(0xFF00FF88).withValues(alpha: 0.3), 
      height: 70 // Shorter height looks more professional
    );
  }
}
