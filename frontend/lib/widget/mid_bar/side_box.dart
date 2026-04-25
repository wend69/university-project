import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/widget/mid_bar/side_box_details.dart';
import 'package:ok/api_service.dart';

class SideBox extends StatelessWidget {
  final AnalyticsRow data;
  const SideBox({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double sideBoxHeight = MediaQuery.of(context).size.height;
    return Container(
      height: sideBoxHeight > 770 ? sideBoxHeight - 350 : 415,
      width: 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [MainTheme.boxColor.withValues(alpha: 0.2), MainTheme.boxColor, MainTheme.boxColor.withValues(alpha:0.2)],
        ),
        border: Border.all(color: MainTheme.boxBorderColor, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: SideBoxDetails(data: data), // Pass the data baton
    );
  }
}

