import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ramdan_quran_app/QiblaDirection.dart';
import 'package:ramdan_quran_app/screens/Corona.dart';
import 'package:ramdan_quran_app/screens/PrayerTime.dart';
import 'package:ramdan_quran_app/screens/QiblaDirectionScreen/Compass.dart';
import 'package:ramdan_quran_app/screens/Quran.dart';

import 'package:ramdan_quran_app/screens/RamdanCalender.dart';
import 'package:ramdan_quran_app/screens/TasbeehCounter.dart';
import 'package:ramdan_quran_app/styles/app_colors.dart';

import 'DuasCopy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            color: AppColors.basicColor,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(90, 110, 50, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Ramdan Pro",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                    child: Text("Quran, Qibla, Dua",
                        style: TextStyle(fontSize: 23, color: Colors.white))),
              ],
            ),
          ),
          //   Padding(
          //     padding: const EdgeInsets.fromLTRB(5, 210, 5, 0),
          //     child: Center(
          //         child: GridView.extent(
          //       primary: false,
          //       padding: const EdgeInsets.all(16),
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10,
          //       maxCrossAxisExtent: 200.0,
          //       children: <Widget>[
          //         Container(
          //           color: Colors.pink,
          //           height: MediaQuery.of(context).size.height * 0.99,
          //           padding: const EdgeInsets.all(8),
          //           child: Column(
          //             children: [
          //               const CircleAvatar(
          //                 backgroundImage:
          //                     AssetImage('lib/assets/icons/splash icon.png'),
          //                 // backgroundColor: Colors.transparent,
          //               ),
          //               SizedBox(
          //                 height: MediaQuery.of(context).size.height * 0.09,
          //               ),
          //               const Text(
          //                 "Qibla Direction",
          //                 style: TextStyle(
          //                     fontSize: 20,
          //                     color: Color.fromARGB(255, 10, 18, 34),
          //                     fontWeight: FontWeight.bold),
          //               ),
          //             ],
          //           ),
          //           //color: Colors.white,
          //         ),
          //         Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text('Second', style: TextStyle(fontSize: 20)),
          //           color: Colors.blue,
          //         ),
          //         Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text('Third', style: TextStyle(fontSize: 20)),
          //           color: Colors.blue,
          //         ),
          //         Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text('Four', style: TextStyle(fontSize: 20)),
          //           color: Colors.yellow,
          //         ),
          //         Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text('Fifth', style: TextStyle(fontSize: 20)),
          //           color: Colors.yellow,
          //         ),
          //         Container(
          //           padding: const EdgeInsets.all(8),
          //           child: const Text('Six', style: TextStyle(fontSize: 20)),
          //           color: Colors.blue,
          //         ),
          //       ],
          //     )),
          //   ),
          // ],

          Padding(
            padding: const EdgeInsets.fromLTRB(6, 280, 5, 0),
            child: Row(
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Compass()),
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/icons/campassHome.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const Text(
                              "Qibla Direction",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 10, 18, 34),
                              ),
                            ),
                          ],
                        ),
                        //color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CoronaDefence()),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/icons/Dua.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const Text(
                              "Corona Defence Dua",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 10, 18, 34),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        //color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TasbeehCounter()),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/icons/tasbeehHome.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                            const Text(
                              "Tasbeeh Counter",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 10, 18, 34),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        //color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RamdanCalender()),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width / 2.3,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/icons/calenderHome.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const Text(
                              "Ramdan Calender",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 10, 18, 34),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        //color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrayerTime()),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width / 2.3,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/icons/prayerTime.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const Text(
                              "Prayer Time",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 10, 18, 34),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        //color: Colors.white,
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const RamdanCalender()),
                    //   ),
                    //   child: Container(
                    //     height: MediaQuery.of(context).size.height * 0.313,
                    //     width: MediaQuery.of(context).size.width / 2.23,
                    //     padding: const EdgeInsets.all(8),
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         SizedBox(
                    //           height: MediaQuery.of(context).size.height * 0.02,
                    //         ),
                    //         Container(
                    //           height: 40,
                    //           width: 40,
                    //           decoration: const BoxDecoration(
                    //             image: DecorationImage(
                    //               image: ExactAssetImage(
                    //                   'lib/assets/icons/calenderHome.png'),
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           height: MediaQuery.of(context).size.height * 0.19,
                    //         ),
                    //         const Text(
                    //           "Ramdan Calender",
                    //           style: TextStyle(
                    //               fontSize: 17,
                    //               color: Color.fromARGB(255, 10, 18, 34),
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ],
                    //     ),
                    //     color: Colors.white,
                    //   ),
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DuaCopy()),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width / 2.3,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/icons/Dua.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            const Text(
                              "Dua's",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 10, 18, 34),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        //color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.012,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Quran()),
                      ),
                      child: Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: MediaQuery.of(context).size.width / 2.3,
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: ExactAssetImage(
                                      'lib/assets/icons/QuranHome.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const Text(
                              "Quran",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 10, 18, 34),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        //color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
