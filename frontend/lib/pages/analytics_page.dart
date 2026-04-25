import 'package:flutter/material.dart';
import 'package:ok/widget/top_bar/top_box.dart';
import '../api_service.dart';








class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  late Future<AnalyticsRow> _analyticsFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Methodized this so you can call it again to refresh
  void _loadData() {
    setState(() {
      _analyticsFuture = fetchLatestAnalytics();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Clean, modern background
      appBar: AppBar(
        title: const Text("Analytics Overview"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData, // Manual refresh button
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
            return ListView( // Use ListView to prevent "Bottom Overflow"
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              children: [
                TopBox(liveData: data),
                _buildStatCard("Total Streams", data.streams.toString(), Colors.blue),
                const SizedBox(height: 15),
                _buildStatCard("Engagement Rate", "${data.engagementRate}%", Colors.green),
                const SizedBox(height: 15),
                _buildStatCard("Watch Time", "${data.watchT}h", Colors.orange),
                const SizedBox(height: 15),
                _buildStatCard("Audience Size", data.audience.toString(), Colors.purple),
                const SizedBox(height: 15),
                _buildStatCard("Satisfaction", "${data.audienceSatisfaction}/5", Colors.redAccent),
                const SizedBox(height: 15),
                _buildStatCard("New Subscribers", "+${data.newSubscribe}", Colors.teal),
                const SizedBox(height: 20),
                Text(
                  "Data ID: ${data.id}\nLast Sync: ${data.createdAt}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                const SizedBox(height: 30),
              ],
            );
          }

          return const Center(child: Text("No data found in the database."));
        },
      ),
    );
  }

  // A quick helper widget to make the data look like a real dashboard
  Widget _buildStatCard(String label, String value, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05), 
            blurRadius: 10, 
            offset: const Offset(0, 4)
          ),
        ],
      ),
      child: Row( // Using a Row to keep the cards compact
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          Icon(Icons.trending_up, color: color.withValues(alpha: 0.3), size: 40),
        ],
      ),
    );
  }
}


