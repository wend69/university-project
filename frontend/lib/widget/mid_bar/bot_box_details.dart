import 'package:flutter/material.dart';
import 'package:ok/api_service.dart';

class BotBoxDetails extends StatelessWidget {
  final AnalyticsRow data;
  const BotBoxDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text("Latest Stream Audience: ${data.audience}", 
               style: const TextStyle(color: Colors.white)),
          // ... rest of your UI using the data variable ...
        ],
      ),
    );
  }
}
