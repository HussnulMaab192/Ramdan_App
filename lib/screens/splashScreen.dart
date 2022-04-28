import 'package:flutter/material.dart';
import 'package:ramdan_quran_app/screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 31, 80, 104),
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              child: const CircleAvatar(
                backgroundImage: AssetImage('lib/assets/icons/splash icon.png'),
                backgroundColor: Colors.transparent,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
                child: Text(
              "Ramdan Pro",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
                child: Text("Quran, Qibla, Dua",
                    style: TextStyle(fontSize: 19, color: Colors.white))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: const BorderSide(width: 1, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()),
                    );
                  },
                  child: const Text(
                    "START",
                    style: TextStyle(
                        color: Color.fromARGB(255, 42, 49, 65),
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
