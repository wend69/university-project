import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/widget/mid_bar/bot_box_details.dart';
import 'package:ok/api_service.dart';

class BotBox extends StatelessWidget {
  final AnalyticsRow data;
  const BotBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double botBoxWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 226,
      width: botBoxWidth > 1430 ? botBoxWidth - 975 : 455,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [MainTheme.boxColor.withValues(alpha: 0.2), MainTheme.boxColor, MainTheme.boxColor.withValues(alpha:0.2)],
        ),
        border: Border.all(color: MainTheme.boxBorderColor, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: BotBoxDetails(data: data), // Pass the data baton
    );
  }
}
