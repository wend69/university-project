import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ok/style/theme.dart';
import 'package:ok/api_service.dart';


class SimpleLineChart extends StatelessWidget {
  final double boxHeight;
  final double boxWidth;
  final AnalyticsRow data;

  const SimpleLineChart({
    super.key,
    required this.boxHeight,
    required this.boxWidth,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Material( // FIX: Wraps the chart to prevent underlines on axis labels
      color: Colors.transparent,
      child: SizedBox(
        width: boxWidth,
        height: boxHeight,
        child: LineChart(
          LineChartData(
            // FIX: Removes default axis titles which often cause the underline bug
            titlesData: const FlTitlesData(show: false), 
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                curveSmoothness: 0.5,
                color: MainTheme.primaryColor,
                barWidth: 3,
                dotData: const FlDotData(show: false), // Cleaner dashboard look
                spots: [
                  const FlSpot(0, 1),
                  const FlSpot(1, 2.5),
                  // Scaling the PSQL data to fit the chart's Y-axis (0-5 range)
                  FlSpot(2, (data.audience.toDouble() / 20000).clamp(0, 5)), 
                  const FlSpot(3, 4),
                  const FlSpot(4, 3.8),
                ],
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      MainTheme.primaryColor.withValues(alpha: 0.3), 
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
