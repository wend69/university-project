import 'package:flutter/material.dart';
import '../api_service.dart';


class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Analytics Overview")),
      body: FutureBuilder(
        future: fetchLatestAnalytics(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Streams: ${data.streams}", style: const TextStyle(fontSize: 24)),
                  Text("Engagement: ${data.engagementRate}%"),
                ],
              ),
            );
          }
          return const Center(child: Text("No data found"));
        },
      ),
    );
  }
}

