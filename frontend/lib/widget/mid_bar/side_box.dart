// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/widget/mid_bar/side_box_details.dart';

class SideBox extends StatelessWidget {
  const SideBox({super.key});

  @override
  Widget build(BuildContext context) {
    double sideBoxHeight = MediaQuery.of(context).size.height;
    return Container(
      height: sideBoxHeight > 770 ? sideBoxHeight - 350 : 415,
      width: 400,
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
      child: SideBoxDetails(),
    );
  }
}
