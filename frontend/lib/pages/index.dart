import 'package:flutter/material.dart';
import 'package:ok/widget/app_bar.dart';
import 'package:ok/widget/index_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appbar(), body: Homebody());
  }
}
