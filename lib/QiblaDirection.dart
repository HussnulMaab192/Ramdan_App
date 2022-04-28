import 'package:flutter/material.dart';
import 'package:ramdan_quran_app/styles/app_colors.dart';

class QiblaDirection extends StatefulWidget {
  const QiblaDirection({Key key}) : super(key: key);

  @override
  State<QiblaDirection> createState() => _QiblaDirectionState();
}

class _QiblaDirectionState extends State<QiblaDirection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Qibla Direction",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: AppColors.basicColor,
      ),
      body: Stack(
        children: [
          // compass
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 110, 30, 0),
            child: Container(
              height: 340,
              width: 340,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('lib/assets/icons/compas.png'),
                ),
              ),
            ),
          ),
          // needle
          Padding(
            padding: const EdgeInsets.fromLTRB(65, 160, 30, 0),
            child: Container(
              height: 240,
              width: 240,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('lib/assets/icons/needle.png'),
                ),
              ),
            ),
          ),
          // text Distance of kabah and direction
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 520, 20, 10),
            child: Column(
              children: [
                const Text(
                  "  Distance of Kabah:",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.basicColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  "Degree of Qibla :",
                  style: TextStyle(
                    fontSize: 21.5,
                    color: AppColors.basicColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
