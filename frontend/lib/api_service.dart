import 'package:http/http.dart' as http;
import 'dart:convert';



class AnalyticsRow {
  final String id; // UUID is a String
  final String createdAt;
  final int newSubscribe;
  final int streams;
  final double engagementRate;
  final int watchT;
  final int audience;
  final double audienceSatisfaction;
  final String chart;

  AnalyticsRow({
    required this.id,
    required this.createdAt,
    required this.newSubscribe,
    required this.streams,
    required this.engagementRate,
    required this.watchT,
    required this.audience,
    required this.audienceSatisfaction,
    required this.chart,
  });

  factory AnalyticsRow.fromJson(Map<String, dynamic> json) {
    return AnalyticsRow(
      id: json['id'].toString(),
      createdAt: json['create_at'] ?? '',
      newSubscribe: json['new_subscribe'] ?? 0,
      streams: json['streams'] ?? 0,
      // Using .toDouble() ensures that even if the DB sends 0, it becomes 0.0
      engagementRate: (json['engagement_rate'] as num?)?.toDouble() ?? 0.0,
      watchT: json['watch_t'] ?? 0,
      audience: json['audience'] ?? 0,
      audienceSatisfaction: (json['audience_satisfaction'] as num?)?.toDouble() ?? 0.0,
      chart: json['chart'] ?? '',
    );
  }
}

Future<AnalyticsRow> fetchLatestAnalytics() async {
  // Use 127.0.0.1 for Linux desktop, or 10.0.2.2 for Android Emulator
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/analytics/latest'));

  if (response.statusCode == 200) {
    List<dynamic> body = jsonDecode(response.body);
    
    if (body.isEmpty) {
      throw Exception('No data available');
    }

    // Since backend uses LIMIT 1, we take the first item in the list
    return AnalyticsRow.fromJson(body[0]);
  } else {
    throw Exception('Failed to load analytics: ${response.statusCode}');
  }
}

