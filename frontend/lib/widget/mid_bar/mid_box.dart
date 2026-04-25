
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/widget/mid_bar/mid_bar_details.dart';
import 'package:ok/api_service.dart';

class MidBox extends StatelessWidget {
  final AnalyticsRow data;
  const MidBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double midBoxWidth = MediaQuery.of(context).size.width;
    double midBoxHeight = MediaQuery.of(context).size.height;
    double midBoxHeightOriginal = midBoxHeight - 620;
    return Container(
      height: midBoxHeight > 770 ? midBoxHeightOriginal : 230,
      width: midBoxWidth > 1430 ? midBoxWidth - 975 : 455,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MainTheme.boxColor.withOpacity(0.2),
            MainTheme.boxColor,
            MainTheme.boxColor.withOpacity(0.2),
          ],
        ),
        border: Border.all(color: MainTheme.boxBorderColor, width: 1.5),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 34, right: 34),
        child: MidBarDetails(
          data: data, 
          boxHeight: midBoxHeight > 770
              ? midBoxHeightOriginal - 115
              : 230 - 115,
          boxWidth: midBoxWidth > 1430 ? midBoxWidth - 975 : 455,
        ),
      ),
    );
  }
}

