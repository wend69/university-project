
import 'package:flutter/material.dart';
import 'package:ok/widget/side_button.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  List sideButtonTexts = [
    {"icon": Icons.forward_to_inbox_rounded, "text": "Inbox", "not": true},
    {"icon": Icons.punch_clock, "text": "Alerts", "not": false},
    {"icon": Icons.dashboard_outlined, "text": "Overview", "not": false},
  ];

  List sideButtonTexts2 = [
    {"icon": Icons.mic, "text": "Episodes", "not": false},
    {"icon": Icons.folder, "text": "Media", "not": false},
    {"icon": Icons.list, "text": "Materials", "not": false},
    {"icon": Icons.people, "text": "Contacts", "not": false},
  ];
  List sideButtonTexts3 = [
    {"icon": Icons.sd_card, "text": "Subscribers", "not": true},
    {"icon": Icons.scatter_plot_rounded, "text": "Channels", "not": false},
    {"icon": Icons.line_weight_rounded, "text": "Integrations", "not": false},
    {"icon": Icons.report_sharp, "text": "Reports", "not": false},
  ];

  String selectedText = "Inbox";

  void isSelected(String text) {
    setState(() {
      selectedText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    double sideBarHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsetsGeometry.only(left: 50, top: 35, right: 10),
      height: sideBarHeight,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(35)),

        color: Color.fromRGBO(7, 19, 17, 1),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: List.generate(
                sideButtonTexts.length,
                (index) => InkWell(
                  onTap: () => isSelected(sideButtonTexts[index]['text']),
                  child: SideButton(
                    text: sideButtonTexts[index]['text'],
                    icon: sideButtonTexts[index]['icon'],
                    notification: sideButtonTexts[index]['not'],
                    isSelected: sideButtonTexts[index]['text'] == selectedText,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 50),
              child: Text(
                'Postcasts',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),

            Column(
              children: List.generate(
                sideButtonTexts2.length,
                (index) => InkWell(
                  onTap: () => isSelected(sideButtonTexts2[index]['text']),
                  child: SideButton(
                    text: sideButtonTexts2[index]['text'],
                    icon: sideButtonTexts2[index]['icon'],
                    notification: sideButtonTexts2[index]['not'],
                    isSelected: sideButtonTexts2[index]['text'] == selectedText,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 50),
              child: Text(
                'Analytics',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
            Column(
              children: List.generate(
                sideButtonTexts3.length,
                (index) => InkWell(
                  onTap: () => isSelected(sideButtonTexts3[index]['text']),
                  child: SideButton(
                    text: sideButtonTexts3[index]['text'],
                    icon: sideButtonTexts3[index]['icon'],
                    notification: sideButtonTexts3[index]['not'],
                    isSelected: sideButtonTexts3[index]['text'] == selectedText,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
