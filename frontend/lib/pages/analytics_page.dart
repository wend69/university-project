import 'package:flutter/material.dart';
import 'package:ok/widget/top_bar/top_box.dart';
import '../api_service.dart';
import 'package:ok/widget/mid_bar/mid_bar_details.dart';
import 'package:ok/widget/mid_bar/pie_chart.dart';
import 'package:ok/widget/mid_bar/bot_box.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  late Future<AnalyticsRow> _analyticsFuture;
// This refreshes the Future and triggers the UI to reload
  void _loadData() {
    setState(() {
      _analyticsFuture = fetchLatestAnalytics();
    });
  }

  @override
  void initState() {
    super.initState();
    _analyticsFuture = fetchLatestAnalytics(); // Fetching latest data on init
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    
     appBar: AppBar(
  backgroundColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
  // Force the text to be White and slightly spaced out for that "Dashboard" feel
  title: const Text(
    "Analytics Overview",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
      letterSpacing: 1.2,
    ),
  ),
  centerTitle: true,
  elevation: 0,
  // This ensures the refresh button is white/visible
  actionsIconTheme: const IconThemeData(color: Colors.white),
  actions: [
    IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: _loadData,
    )
  ],
),
      body: FutureBuilder<AnalyticsRow>(
        future: _analyticsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("❌", style: TextStyle(fontSize: 40)),
                    const SizedBox(height: 10),
                    Text("Error: ${snapshot.error}", textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    ElevatedButton(onPressed: _loadData, child: const Text("Retry"))
                  ],
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              children: [
                // 1. Top Metrics
                TopBox(liveData: data), 
                const SizedBox(height: 20), 
                
                // 2. Main Chart Area
                const SizedBox(height: 20),
                SizedBox(
                   height: 230,
                   child: MidBarDetails(
                     data: data, // Added missing comma
                     boxHeight: 180,
                     boxWidth: MediaQuery.of(context).size.width,
                   ),
                 ),
                const SizedBox(height: 20),

                // 3. Pie Chart
                SizedBox(
                  height: 220,
                  width: 220,
                  child: GlowCircularProgress(percentage: data.engagementRate) // Passed data argument
                 ),
                const SizedBox(height: 20),

                // 4. Statistics Cards
                _buildStatCard("Total Streams", data.streams.toString(), Colors.blue),
                const SizedBox(height: 15),
                _buildStatCard("Engagement Rate", "${data.engagementRate}%", Colors.green),
                const SizedBox(height: 15),
                _buildStatCard("Watch Time", "${data.watchT}h", Colors.orange),
                const SizedBox(height: 15),
                
                // 5. Bot Box
                BotBox(data: data), 
                const SizedBox(height: 20),

                // 6. Footer Info
                Text(
                  "Data ID: ${data.id}\nLast Sync: ${data.createdAt}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 30),
              ], // Properly closed children list
            );
          }
          return const Center(child: Text("No data found in the database."));
        },
      ),
    );
  }

Widget _buildStatCard(String label, String value, Color color) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    margin: const EdgeInsets.only(bottom: 16), // Adds space between cards
    decoration: BoxDecoration(
      // 1. Swap white for a dark, translucent green tint
      color: const Color(0xFF00FF88).withValues(alpha: 0.05), 
      borderRadius: BorderRadius.circular(16),
      // 2. Add a neon green border instead of a shadow
      border: Border.all(
        color: const Color(0xFF00FF88).withValues(alpha: 0.2), 
        width: 1.5,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 3. Make the label white/grey so it's readable on dark
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold, 
                color: const Color(0xFF00FF88), // Use neon green for the numbers
              ),
            ),
          ],
        ),
        // 4. Update the icon color to match
        Icon(Icons.trending_up, color: const Color(0xFF00FF88).withValues(alpha: 0.4), size: 40),
      ],
    ),
  );
}
}
