import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';

class BotBoxDetails extends StatelessWidget {
  const BotBoxDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 60.0, right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Episodes",
                    style: TextStyle(color: Colors.grey.shade800),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: MainTheme().primaryColor),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60.0,
                right: 60,
                top: 12,
                bottom: 8,
              ),
              child: Container(height: 0.5, color: Colors.grey.shade800),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: MainTheme().primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Icon(Icons.mic),
                      ),
                      SizedBox(width: 13),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "kuji Podcast 33: Live",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Guest: Nurlan Saburov",
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "1,58m",
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Live",
                        style: TextStyle(color: MainTheme().primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60.0,
                right: 60,
                top: 12,
                bottom: 8,
              ),
              child: Container(height: 0.5, color: Colors.grey.shade800),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: MainTheme().primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Icon(Icons.mic),
                      ),
                      SizedBox(width: 13),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "kuji Podcast 20: Live",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Guest: Nurlan Saburov",
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "1,58m",
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Live",
                        style: TextStyle(color: MainTheme().primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60.0,
                right: 60,
                top: 12,
                bottom: 8,
              ),
              child: Container(height: 0.5, color: Colors.grey.shade800),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: MainTheme().primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Icon(Icons.mic),
                      ),
                      SizedBox(width: 13),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "kuji Podcast 24: Live",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "Guest: Nurlan Saburov",
                            style: TextStyle(color: Colors.grey.shade800),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "1,58m",
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Live",
                        style: TextStyle(color: MainTheme().primaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60.0,
                right: 60,
                top: 12,
                bottom: 8,
              ),
              child: Container(height: 0.5, color: Colors.grey.shade800),
            ),
          ],
        ),
      ),
    );
  }
}
