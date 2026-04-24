import 'package:flutter/material.dart';
import 'package:ok/widget/mid_bar/bot_box.dart';
import 'package:ok/widget/mid_bar/mid_box.dart';
import 'package:ok/widget/mid_bar/side_box.dart';
import 'package:ok/widget/side_widget.dart';
import 'package:ok/widget/top_bar/top_box.dart';

class Homebody extends StatefulWidget {
  const Homebody({super.key});

  @override
  State<Homebody> createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideMenu(),
          SizedBox(width: 31),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                TopBox(),
                SizedBox(height: 45),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [MidBox(), SizedBox(height: 45), BotBox()],
                    ),
                    SizedBox(width: 45),
                    SideBox(),
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
