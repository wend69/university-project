// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/widget/mid_bar/bot_box_details.dart';

class BotBox extends StatelessWidget {
  const BotBox({super.key});

  @override
  Widget build(BuildContext context) {
    double botBoxWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 226,
      width: botBoxWidth > 1430 ? botBoxWidth - 975 : 455,
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
      child: BotBoxDetails(),
    );
  }
}
