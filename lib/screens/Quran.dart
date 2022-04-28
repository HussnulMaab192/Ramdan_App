// ignore_for_file: deprecated_member_use

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:ramdan_quran_app/screens/my_audio_player.dart';
import 'package:ramdan_quran_app/styles/app_colors.dart';
import 'package:quran/quran.dart' as quran;

class Quran extends StatefulWidget {
  const Quran({Key key}) : super(key: key);

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  String surahname;
  AudioPlayer player = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();
  bool playing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quran",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: AppColors.basicColor,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.77,
            child: ListView.builder(
                // scrollDirection: Axis.vertical,
                // shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: 114,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: AppColors.basicColor, width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      title: Text(
                        quran.getSurahNameArabic(index + 1),
                        textAlign: TextAlign.center,
                      ),
                      leading: Text(
                        "${index + 1}",
                        style: const TextStyle(
                            fontSize: 19, color: AppColors.basicColor),
                      ),
                      trailing: IconButton(
                          icon: const Icon(
                            Icons.play_circle_filled_outlined,
                            color: AppColors.basicColor,
                          ),
                          onPressed: () {
                            // showDialog(
                            //   context: context,
                            //   builder: (BuildContext context) =>
                            //       _buildPopupDialog(context),
                            // );

                            showModalBottomSheet(
                              context: context,
                              builder: ((builder) => bottomSheet()),
                            );
                          }),
                    ),
                  );
                })),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 130.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            IconButton(
              onPressed: () async {
                getAudio();
              },
              icon: Icon(
                playing == false
                    ? Icons.play_circle_filled_outlined
                    : Icons.pause,
                size: 60,
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
      setState(() {
        playing = true;
      });
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
