import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ramdan_quran_app/styles/app_colors.dart';

//03178831302 zahid mobin
class TasbeehCounter extends StatefulWidget {
  const TasbeehCounter({Key key}) : super(key: key);

  @override
  State<TasbeehCounter> createState() => _TasbeehCounterState();
}

class _TasbeehCounterState extends State<TasbeehCounter> {
  int val1 = 0;
  int val2 = 0;
  int val3 = 0;
  int val4 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tasbeeh Counter",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: AppColors.basicColor,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(270, 50, 10, 0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  val1 = 0;
                  val2 = 0;
                  val3 = 0;
                  val4 = 0;
                });
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/icons/clear.png'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 230, 10, 0),
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('lib/assets/icons/counter_bg.png'),
                ),
              ),
              child: Center(
                child: Text(
                  '$val4',
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(110, 230, 10, 0),
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('lib/assets/icons/counter_bg.png'),
                ),
              ),
              child: Center(
                child: Text(
                  '$val3',
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(170, 230, 10, 0),
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('lib/assets/icons/counter_bg.png'),
                ),
              ),
              child: Center(
                child: Text(
                  '$val2',
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(230, 230, 10, 0),
            child: Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('lib/assets/icons/counter_bg.png'),
                ),
              ),
              child: Center(
                child: Text(
                  // "0",
                  // style: TextStyle(color: Colors.white, fontSize: 50),
                  '$val1',
                  style: const TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: _incrementCounter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 400, 10, 0),
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/icons/push_btn.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      val1++;
      if (val1 == 10) {
        val2++;
        val1 = 0;
      }
      if (val2 == 10) {
        val3++;
        val2 = 0;
      }
      if (val3 == 10) {
        val4++;
        val3 = 0;
      }
    });
  }
}
