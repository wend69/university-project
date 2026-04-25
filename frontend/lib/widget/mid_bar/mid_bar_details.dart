import 'package:flutter/material.dart'; 
import 'package:ok/widget/mid_bar/chart.dart';
import '../../api_service.dart';


class MidBarDetails extends StatefulWidget {
  final AnalyticsRow data;
  final double boxHeight;
  final double boxWidth;

  const MidBarDetails({
    super.key,
    required this.data,
    required this.boxHeight,
    required this.boxWidth,
  }); 

  @override
  State<MidBarDetails> createState() => _MidBarDetailsState();
} 

class _MidBarDetailsState extends State<MidBarDetails> {
  double change = 43.46;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Audience", style: TextStyle(color: Colors.grey, fontSize: 15)),
        const SizedBox(height: 3),
        Text(
          widget.data.audience.toString(), // ACCESSING LIVE DATA
          style: const TextStyle(color: Colors.white, fontSize: 34),
        ),
        const SizedBox(height: 10),
        SimpleLineChart(
          boxHeight: widget.boxHeight,
          boxWidth: widget.boxWidth,
          data: widget.data, // SYNCING CHART
        ),
      ],
    );
  }
}
