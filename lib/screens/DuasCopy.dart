import 'package:flutter/material.dart';
import 'package:ramdan_quran_app/styles/app_colors.dart';

class DuaCopy extends StatefulWidget {
  const DuaCopy({Key key}) : super(key: key);

  @override
  State<DuaCopy> createState() => _DuaCopyState();
}

class _DuaCopyState extends State<DuaCopy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dua's",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: AppColors.basicColor,
      ),
    );
  }
}
