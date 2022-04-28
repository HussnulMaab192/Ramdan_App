import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:ramdan_quran_app/Model/sehri_aftari_calculation.dart';
import 'package:ramdan_quran_app/styles/app_colors.dart';
import 'package:hijri/digits_converter.dart';
import 'package:hijri/hijri_array.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:adhan/adhan.dart';

class RamdanCalender extends StatefulWidget {
  const RamdanCalender({Key key}) : super(key: key);

  @override
  State<RamdanCalender> createState() => _RamdanCalenderState();
}

class _RamdanCalenderState extends State<RamdanCalender> {
  SehriAftari obj = SehriAftari();
  int count = 0;
  var today;
  int startOfRamdan;
  int todayMonth;
  int todayYear;
  int todayCInt;
  int length;
  DateTime ramdanDateSetter;
  var d;
  hijriRamdan() {
    today = HijriCalendar.fromDate(DateTime.now());
    // to get the current date .
    ramdanDateSetter = HijriCalendar().hijriToGregorian(today.hYear, 9, 1);
//startoframdan
    startOfRamdan = HijriCalendar().hijriToGregorian(today.hYear, 9, 0).day;
    // recent month
    todayMonth = HijriCalendar()
        .hijriToGregorian(today.hYear, today.hMonth, today.hDay)
        .month;
    // recent year
    todayYear = HijriCalendar()
        .hijriToGregorian(today.hYear, today.hMonth, today.hDay)
        .year;
    // to calculate the length of ramdan.
    length = today.lengthOfMonth;
  }

  var sehri;
  var aftar;

  double lat;
  double longi;
  List<dynamic> timeCalc = [];
  @override
  void initState() {
    if (lat == null || longi == null) {
      lat = 33.6844;
      longi = 73.0479;
    }
    getCurruntLocation();
    hijriRamdan();
    d = ramdanDateSetter;
    sehriCalculation();
    super.initState();
  }

  getDay() {
    d = addDay(d);
    var formattedMamlat = DateFormat("dd-MM-yyyy").format(d);
    return (formattedMamlat);
  }

  @override
  var locationMessage = "";
  //this is to get Coordinates.
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ramdan Calender",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: AppColors.basicColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // this is header # Date Sehri End Aftari End
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
              child: Row(children: [
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 320,
                  color: AppColors.basicColor,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 10, 5),
                    child: Text(
                      "#",
                      style: TextStyle(fontSize: 19, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 245,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 5),
                    child: Text(
                      "Date",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  color: AppColors.basicColor,
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 273,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                    child: Text(
                      "Sehri End",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  color: AppColors.basicColor,
                ),
                const SizedBox(
                  width: 2,
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width - 280,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(5, 10, 0, 5),
                    child: Text(
                      "Aftar End",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  color: AppColors.basicColor,
                ),
              ]),
            ),

            // Scroll view padding

            Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.77,
                child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: timeCalc.length,
                    itemBuilder: ((context, index) {
                      return Row(children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 320,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(
                                  fontSize: 10, color: AppColors.basicColor),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 245,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 5),
                            child: Text(
                              timeCalc[index].date,
                              style: const TextStyle(
                                  fontSize: 16, color: AppColors.basicColor),
                            ),
                          ),
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 273,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                            child: Text(
                              timeCalc[index].sehri,
                              style: const TextStyle(
                                  fontSize: 16, color: AppColors.basicColor),
                            ),
                          ),
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 280,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
                            child: Text(
                              timeCalc[index].aftari,
                              style: const TextStyle(
                                  fontSize: 16, color: AppColors.basicColor),
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ]);
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // sehri will calculate the timmings of sehri and aftari.
  sehriCalculation() {
    final mylocation = Coordinates(lat, longi);
    final nyUtcOffset = DateTime.now().timeZoneOffset;

    for (int i = startOfRamdan; i <= length; i++) {
      final nyDate = DateComponents(todayYear, todayMonth, i);
      final nyParams = CalculationMethod.muslim_world_league.getParameters();
      nyParams.madhab = Madhab.hanafi;
      final nyPrayerTimes =
          PrayerTimes(mylocation, nyDate, nyParams, utcOffset: nyUtcOffset);
      sehri = DateFormat.jm().format(nyPrayerTimes.fajr);
      aftar = DateFormat.jm().format(nyPrayerTimes.maghrib);
      timeCalc.add(
          SehriAftari(date: getDay().toString(), aftari: aftar, sehri: sehri));
    }
  }

  // this will add the day in previous day,
  DateTime addDay(DateTime d) {
    return d.add(const Duration(days: 1));
  }
}
