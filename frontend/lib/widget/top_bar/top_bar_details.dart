// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';

class TopBarDetails extends StatelessWidget {
  final String title;
  final String data;
  final double change;
  const TopBarDetails({
    super.key,
    required this.title,
    required this.data,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: Colors.white, fontSize: 15)),

        Text(data, style: TextStyle(color: Colors.white, fontSize: 30)),
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
            Text(
              "${change > 0 ? "+" : ""}$change%",
              style: TextStyle(
                color: change > 0
                    ? MainTheme().primaryColor
                    : const Color.fromARGB(255, 240, 24, 9),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
