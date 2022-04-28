import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class CoronaDefence extends StatefulWidget {
  const CoronaDefence({Key key}) : super(key: key);

  @override
  State<CoronaDefence> createState() => _CoronaDefenceState();
}

class _CoronaDefenceState extends State<CoronaDefence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Corona Defence Dua",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: AppColors.basicColor,
      ),
    );
  }
}
