// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/widget/mid_bar/chart.dart';

class MidBarDetails extends StatefulWidget {
  final double boxHeight;
  final double boxWidth;
  const MidBarDetails({
    super.key,
    required this.boxHeight,
    required this.boxWidth,
  });

  @override
  State<MidBarDetails> createState() => _MidBarDetailsState();
}

class _MidBarDetailsState extends State<MidBarDetails> {
  double change = 43.46;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Audience", style: TextStyle(color: Colors.grey, fontSize: 15)),
        SizedBox(height: 3),
        Text('405,654', style: TextStyle(color: Colors.white, fontSize: 34)),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: change > 0
                    ? MainTheme().boxBorderColor.withOpacity(0.5)
                    : Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Icon(
                change > 0
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                color: change > 0
                    ? MainTheme().primaryColor
                    : const Color.fromARGB(255, 240, 24, 9),
                size: 18,
              ),
            ),
            SizedBox(width: 10),
            Row(
              children: [
                Text(
                  "${change > 0 ? "+" : ""}$change%",
                  style: TextStyle(
                    color: change > 0
                        ? MainTheme().primaryColor
                        : const Color.fromARGB(255, 240, 24, 9),
                  ),
                ),
                Text(" for 7 last days", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        SimpleLineChart(boxHeight: widget.boxHeight, boxWidth: widget.boxWidth),
      ],
    );
  }
}
