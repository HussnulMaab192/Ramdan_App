// ignore_for_file: import_of_legacy_library_into_null_safe, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ramdan_quran_app/styles/app_colors.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

import 'package:hijri/hijri_calendar.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({Key key}) : super(key: key);

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

enum fiqah { Hanfi, Shafi }

class _PrayerTimeState extends State<PrayerTime> {
  var dayNameHijri;
  String hijriDate;
  var sehri;
  var aftari;

  @override
  Color dumyColor = Colors.white;
  var date;
  var qibla;
  String nextPrayer = "Next";
  fiqah _character = fiqah.Hanfi;
  DateTime now;
  int formatTime = 0;
  String formattedDate;
  String formattedTime;
  DateTime truen;
  var fajar;
  var zuhar;
  var asar;
  var maghrib;
  var esha;
  double lat;
  double longi;
  Duration diff;

  void initState() {
    //  showMessage();
    now = DateTime.now();
    formattedDate = DateFormat('EEEEEE, dd,MMM,yyyy ').format(now);
    formattedTime = DateFormat("hh:mm a").format(DateTime.now());

    if (lat == null || longi == null) {
      lat = 33.6844;
      longi = 73.0479;
    }
    hanfiPrayerTime();
    getCurruntLocation();
    super.initState();
  }

  // void showMessage() {
  //   diff = dt1.difference(dt2);
  // }

  var locationMessage = "";
  void getCurruntLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // ignore: unused_local_variable
    var lastPosition = await Geolocator.getLastKnownPosition();

    setState(() {
      locationMessage = "$position";
      lat = position.latitude;
      longi = position.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prayer Time",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: AppColors.basicColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      formattedTime,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 10, 18, 34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Color.fromARGB(255, 10, 18, 34),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // fiqah section.
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Text(
                        "Fiqah",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 50,
                          child: ListTile(
                            title: const Text(
                              'Hanfi',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 10, 18, 34),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            leading: Radio<fiqah>(
                              value: fiqah.Hanfi,
                              groupValue: _character,
                              onChanged: (fiqah value) {
                                setState(() {
                                  _character = value;
                                  hanfiPrayerTime();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ListTile(
                          title: const Text(
                            'Shafi',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 10, 18, 34),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          leading: Radio<fiqah>(
                            value: fiqah.Shafi,
                            groupValue: _character,
                            onChanged: (fiqah value) {
                              setState(() {
                                _character = value;
                                shafiPrayerTime();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            //fajar
            Container(
              color: formatTime == 1
                  ? dumyColor = Colors.greenAccent
                  : Colors.white,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Text(
                        "Fajar",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                      ),
                      Text(
                        "$fajar",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  formatTime == 1
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 13,
                                ),
                                child: Text(
                                  "Next Prayer",
                                  style: TextStyle(
                                      color: AppColors.basicColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ])
                      : Container(),
                ],
              ),
              //color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //dhuhar
            Container(
              color: formatTime == 2
                  ? dumyColor = Colors.greenAccent
                  : Colors.white,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Text(
                        "Dhuhar",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.38,
                      ),
                      Text(
                        "$zuhar",
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  formatTime == 2
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 13,
                                ),
                                child: Text(
                                  "Next Prayer",
                                  style: TextStyle(
                                      color: AppColors.basicColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ])
                      : Container(),
                ],
              ),
              //color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // asar time
            Container(
              color: formatTime == 3
                  ? dumyColor = Colors.greenAccent
                  : Colors.white,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Text(
                        "Asar",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                      ),
                      Text(
                        "$asar",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  // ignore: prefer_const_constructors
                  formatTime == 3
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 13,
                                ),
                                child: Text(
                                  "Next Prayer",
                                  style: TextStyle(
                                      color: AppColors.basicColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ])
                      : Container()
                ],
              ),
              //color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //maghrib time
            Container(
              color: formatTime == 4
                  ? dumyColor = Colors.greenAccent
                  : Colors.white,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Text(
                        "Maghrib",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.37,
                      ),
                      Text(
                        "$maghrib",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  formatTime == 4
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 13,
                                ),
                                child: Text(
                                  "Next Prayer",
                                  style: TextStyle(
                                      color: AppColors.basicColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ])
                      : Container()
                ],
              ),
              //color: Colors.white,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            //Isha Time
            Container(
              color: formatTime == 5 ? Colors.greenAccent : Colors.white,
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      const Text(
                        "Isha",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.43,
                      ),
                      Text(
                        "$esha",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 10, 18, 34),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  formatTime == 5
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 13,
                                ),
                                child: Text(
                                  "Next Prayer",
                                  style: TextStyle(
                                      color: AppColors.basicColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ])
                      : Container()
                ],
              ),
              //color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  hanfiPrayerTime() async {
    final myCoordinates =
        Coordinates(lat, longi); // Replace with your own location lat, lng.
    final params = CalculationMethod.muslim_world_league.getParameters();

    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    fajar = DateFormat.jm().format(prayerTimes.fajr);
    zuhar = DateFormat.jm().format(prayerTimes.dhuhr);
    asar = DateFormat.jm().format(prayerTimes.asr);
    maghrib = DateFormat.jm().format(prayerTimes.maghrib);
    esha = DateFormat.jm().format(prayerTimes.isha);

    var _today = HijriCalendar.now();
    dayNameHijri = _today.getDayName();
    // Get month length in days
    // lengthofMonth = _today.lengthOfMonth; // 30 days
    hijriDate = _today.toFormat("MMMM dd yyyy");
    //qibla = Qibla(Coordinates(lat, longi));
    /// Qibla direction degree (Compass/Clockwise)
    //qibla = qibla.direction;

    // Next prayer is Fajar
    if (DateTime.now().isAfter(prayerTimes.isha) &&
        DateTime.now().isBefore(prayerTimes.fajr) &&
        DateTime.now().isBefore(prayerTimes.dhuhr)) {
      setState(() {
        formatTime = 1;
      });
    } // Next prayer is Zuhar
    else if (DateTime.now().isAfter(prayerTimes.fajr) &&
        DateTime.now().isBefore(prayerTimes.dhuhr) &&
        DateTime.now().isBefore(prayerTimes.asr)) {
      setState(() {
        formatTime = 2;
      });
    }
    // Next prayer is Asr
    else if (DateTime.now().isAfter(prayerTimes.dhuhr) &&
        DateTime.now().isBefore(prayerTimes.asr) &&
        DateTime.now().isBefore(prayerTimes.maghrib)) {
      setState(() {
        formatTime = 3;
      });
    } // Next prayer is Maghrib
    else if (DateTime.now().isAfter(prayerTimes.asr) &&
        DateTime.now().isBefore(prayerTimes.maghrib) &&
        DateTime.now().isBefore(prayerTimes.isha)) {
      setState(() {
        formatTime = 4;
      });
    }
    // Next prayer is Isha
    else if (DateTime.now().isAfter(prayerTimes.maghrib) &&
        DateTime.now().isBefore(prayerTimes.isha) &&
        DateTime.now().isBefore(prayerTimes.fajr)) {
      setState(() {
        formatTime = 5;
      });
    } else {
      formatTime = 0;
    }
  }

  shafiPrayerTime() async {
    final myCoordinates =
        Coordinates(lat, longi); // Replace with your own location lat, lng.
    final params = CalculationMethod.muslim_world_league.getParameters();

    params.madhab = Madhab.shafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    fajar = DateFormat.jm().format(prayerTimes.fajr);
    zuhar = DateFormat.jm().format(prayerTimes.dhuhr);
    asar = DateFormat.jm().format(prayerTimes.asr);
    maghrib = DateFormat.jm().format(prayerTimes.maghrib);
    esha = DateFormat.jm().format(prayerTimes.isha);
    // Next prayer is Fajar
    if (DateTime.now().isAfter(prayerTimes.isha) &&
        DateTime.now().isBefore(prayerTimes.fajr) &&
        DateTime.now().isBefore(prayerTimes.dhuhr)) {
      setState(() {
        formatTime = 1;
      });
    } // Next prayer is Zuhar
    else if (DateTime.now().isAfter(prayerTimes.fajr) &&
        DateTime.now().isBefore(prayerTimes.dhuhr) &&
        DateTime.now().isBefore(prayerTimes.asr)) {
      setState(() {
        formatTime = 2;
      });
    } // Next prayer is Asar
    else if (DateTime.now().isAfter(prayerTimes.dhuhr) &&
        DateTime.now().isBefore(prayerTimes.asr) &&
        DateTime.now().isBefore(prayerTimes.maghrib)) {
      setState(() {
        formatTime = 3;
      });
    } // Next prayer is maghrib
    else if (DateTime.now().isAfter(prayerTimes.asr) &&
        DateTime.now().isBefore(prayerTimes.maghrib) &&
        DateTime.now().isBefore(prayerTimes.isha)) {
      setState(() {
        formatTime = 4;
      });
    } // Next prayer is esha
    else if (DateTime.now().isAfter(prayerTimes.maghrib) &&
        DateTime.now().isBefore(prayerTimes.isha) &&
        DateTime.now().isBefore(prayerTimes.fajr)) {
      setState(() {
        formatTime = 5;
      });
    } else {
      formatTime = 0;
    }
  }
}
