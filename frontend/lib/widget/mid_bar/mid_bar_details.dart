import 'package:flutter/material.dart'; 
import 'package:ok/widget/mid_bar/chart.dart';
import '../../api_service.dart';
import 'package:ok/style/theme.dart';




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
    return Material(
      color: Colors.transparent, // Keeps your box background visible
      child: DefaultTextStyle(
        style: const TextStyle(decoration: TextDecoration.none), // Final kill for underlines
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Audience",
               
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), decoration: TextDecoration.none, fontSize: 15)
            ),
            const SizedBox(height: 3),
            Text(
              widget.data.audience.toString(), 
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 34, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10),
            // Expanded ensures the chart takes up the remaining space properly
            Expanded( 
              child: SimpleLineChart(
                boxHeight: widget.boxHeight * 0.5,
                boxWidth: widget.boxWidth,
                data: widget.data, 
              ),
            ),
          ],
        ),
      ),
    );
  }

}