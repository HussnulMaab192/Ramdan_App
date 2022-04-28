import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:ramdan_quran_app/styles/app_colors.dart';

class MyAudio extends StatefulWidget {
  const MyAudio({Key key}) : super(key: key);

  @override
  State<MyAudio> createState() => _MyAudioState();
}

class _MyAudioState extends State<MyAudio> {
  double start;
  AudioPlayer player = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        color: Colors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // start and progressing time
            Text(
              '$position'.split('.')[0],
              style: const TextStyle(
                  color: AppColors.basicColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            // slider

            // end time
            Text(
              '$duration'.split('.')[0],
              style: const TextStyle(
                  color: AppColors.basicColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          slider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  playing == false ? Icons.navigate_before_sharp : Icons.pause,
                  size: 60,
                  color: AppColors.basicColor,
                ),
              ),
              InkWell(
                onTap: () {
                  getAudio();
                },
                child: Icon(
                  playing == false
                      ? Icons.play_circle_filled_outlined
                      : Icons.pause,
                  size: 80,
                  color: AppColors.basicColor,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  playing == false ? Icons.navigate_next_sharp : Icons.pause,
                  size: 60,
                  color: AppColors.basicColor,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget slider() {
    return Slider.adaptive(
        thumbColor: AppColors.basicColor,
        activeColor: AppColors.basicColor,
        min: 0.0,
        value: position.inSeconds.toDouble(),
        max: duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            player.seek(Duration(seconds: value.toInt()));
          });
        });
  }

  void getAudio() async {
    var url =
        "https://downloadthequran.com/wp-content/uploads/2021/07/002-Al-Baqara.mp3";
    if (playing) {
      var res = await player.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await player.play(url, isLocal: true);
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
    player.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });

    player.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
