import 'package:flutter/material.dart';

class TopBarDetails extends StatelessWidget {
  final String title;
  final String data;
  final double change;

  // The constructor MUST have these three 'required' lines
  const TopBarDetails({
    super.key,
    required this.title,
    required this.data,
    required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(data, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        const SizedBox(height: 4),
        Text(
          "${change > 0 ? '+' : ''}$change%",
          style: TextStyle(
            color: change > 0 ? Colors.greenAccent : Colors.redAccent,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
