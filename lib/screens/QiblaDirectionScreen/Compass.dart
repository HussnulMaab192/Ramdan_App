import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:ramdan_quran_app/screens/QiblaDirectionScreen/loading_indicator.dart';
import 'package:ramdan_quran_app/screens/QiblaDirectionScreen/qiblah_compass.dart';
import 'package:ramdan_quran_app/screens/QiblaDirectionScreen/qiblah_maps.dart';

class Compass extends StatefulWidget {
  const Compass({Key key}) : super(key: key);

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingIndicator();
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );
          }

          if (snapshot.data) {
            return const QiblahCompass();
          } else {
            return QiblahMaps();
          }
        },
      ),
    ));
  }
}
