import 'package:flutter/material.dart';
import 'package:ok/api_service.dart'; // REQUIRED
import 'package:ok/widget/mid_bar/bot_box.dart';
import 'package:ok/widget/mid_bar/mid_box.dart';
import 'package:ok/widget/mid_bar/side_box.dart';
import 'package:ok/widget/side_widget.dart';
import 'package:ok/widget/top_bar/top_box.dart';

class Homebody extends StatelessWidget {
  final AnalyticsRow data; // Catching live data
  const Homebody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SideMenu(),
          const SizedBox(width: 31),
          SingleChildScrollView(
            child: Column(
              children: [
                TopBox(liveData: data), // Passing to Top
                const SizedBox(height: 45),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        MidBox(data: data), // Passing to Mid
                        const SizedBox(height: 45),
                        BotBox(data: data), // Passing to Bot
                      ],
                    ),
                    const SizedBox(width: 45),
                    SideBox(data: data),    // Passing to Side
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}