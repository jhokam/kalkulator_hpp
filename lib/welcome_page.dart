import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalkulator_hpp/home_page.dart';
import 'package:kalkulator_hpp/main.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      FadeAnimatedWidget(
        child: Image.asset(
          'assets/images/Background Welcome Screen.png',
        ),
      ),
      Align(
          alignment: Alignment.bottomCenter,
          child: FadedScaleAnimationWidget(
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Color(0xffF2F2F2)),
                height: 250,
                width: 327,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Kalkulator HPP',
                          style: GoogleFonts.outfit(
                              textStyle: const TextStyle(
                            color: Color(0xff6871BC),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ))),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 14.0, bottom: 35.0, left: 22.0, right: 22.0),
                        child: Text(
                            'Aplikasi Penghitung HPP adalah alat praktis yang membantu bisnis menghitung biaya produksi barang atau jasa dengan akurat.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    color: Color(0xff756F6F), fontSize: 14))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: 134.0,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage()));
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xff00ACA1)),
                                        elevation:
                                            MaterialStateProperty.all(5.0)),
                                    child: Text('Next',
                                        style: GoogleFonts.quicksand(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)))),
                              ),
                              SizedBox(
                                width: 134.0,
                                child: TextButton(
                                    style: const ButtonStyle(),
                                    onPressed: () {
                                      exit(0);
                                    },
                                    child: Text(
                                      'Skip',
                                      style: GoogleFonts.quicksand(
                                          textStyle: const TextStyle(
                                              color: Color(0xff6871BC),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14)),
                                    )),
                              )
                            ]),
                      )
                    ])),
          ))
    ]));
  }
}
