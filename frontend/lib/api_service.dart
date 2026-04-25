import 'package:http/http.dart' as http;
import 'dart:convert';




// This is your data model - matches your Postgres table
class AnalyticsRow {
  final String id;
  final String createdAt;
  final int newSubscribe;
  final int streams;
  final double engagementRate;
  final int watchT;
  final int audience;
  final double audienceSatisfaction;

  AnalyticsRow({
    required this.id,
    required this.createdAt,
    required this.newSubscribe,
    required this.streams,
    required this.engagementRate,
    required this.watchT,
    required this.audience,
    required this.audienceSatisfaction,
  });

  factory AnalyticsRow.fromJson(Map<String, dynamic> json) {
    return AnalyticsRow(
      id: json['id'].toString(),
      createdAt: json['create_at'] ?? 'N/A',
      newSubscribe: json['new_subscribe'] ?? 0,
      streams: json['streams'] ?? 0,
      // We use .toDouble() because Postgres decimals can be tricky
      engagementRate: (json['engagement_rate'] as num?)?.toDouble() ?? 0.0,
      watchT: json['watch_t'] ?? 0,
      audience: json['audience'] ?? 0,
      audienceSatisfaction: (json['audience_satisfaction'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

Future<AnalyticsRow> fetchLatestAnalytics() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/analytics/latest'));
  
  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body);
    
    // Check if the response is a list and grab the first item
    if (decodedData is List) {
      if (decodedData.isNotEmpty) {
        return AnalyticsRow.fromJson(decodedData[0]); // <--- This fixes the JSArray error
      } else {
        throw Exception('Database returned an empty list');
      }
    }
    
    // If it's already a map, just return it
    return AnalyticsRow.fromJson(decodedData);
  } else {
    throw Exception('Failed to load latest analytics');
  }
}
