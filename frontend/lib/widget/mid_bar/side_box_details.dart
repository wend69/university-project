import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/widget/mid_bar/pie_chart.dart';

class SideBoxDetails extends StatelessWidget {
  const SideBoxDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 30.0,
        left: 30,
        top: 20,
        bottom: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Audience Satisfaction",
                    style: TextStyle(color: MainTheme().primaryColor),
                  ),
                  Icon(Icons.more_vert, color: MainTheme().primaryColor),
                ],
              ),
              SizedBox(height: 20),
              GlowCircularProgress(percentage: 75.5),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("0%", style: TextStyle(color: Colors.grey)),
                  Text(
                    "Based on like / dislike",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text("100%", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Container(height: 0.5, color: Colors.grey),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Webiners", style: TextStyle(color: Colors.grey)),
                  Icon(Icons.more_vert, color: MainTheme().primaryColor),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Learn how you",
                style: TextStyle(color: MainTheme().primaryColor, fontSize: 21),
              ),
              Text(
                "can earn more then",
                style: TextStyle(color: MainTheme().primaryColor, fontSize: 21),
              ),
              Text(
                "20% percent each month!",
                style: TextStyle(color: MainTheme().primaryColor, fontSize: 21),
              ),
              Text(
                "Join our webinar and learn how",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                "to increase more then 20%",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                "your monthly income.",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
          Text(
            "Learn more!",
            style: TextStyle(color: MainTheme().primaryColor, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
