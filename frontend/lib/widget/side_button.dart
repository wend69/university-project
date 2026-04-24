import 'package:flutter/material.dart';
import 'package:ok/style/theme.dart';

class SideButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool notification;
  final bool isSelected;
  const SideButton({
    super.key,
    required this.text,
    required this.icon,
    required this.notification,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? MainTheme().primaryColor : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
        child: Row(
          children: [
            SizedBox(width: 70),
            Icon(
              icon,
              color: isSelected ? Colors.white : MainTheme().primaryColor,
            ),
            SizedBox(width: 15),
            Text(text, style: TextStyle(fontSize: 21, color: Colors.white)),
            SizedBox(width: 50),

            if (notification == true)
              Container(
                width: 21,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 52, 33),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 227, 128, 121),
                      blurRadius: 5,
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Center(
                  child: Text("2", style: TextStyle(color: Colors.white)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
