import 'dart:math';

import 'package:flutter/material.dart';
import 'package:latihan_bmi/screens/hasil.dart';
import 'package:latihan_bmi/widgets/counterBottom.dart';


import '../utils/tema.dart';
import '../widgets/jenis_kelamin_widget.dart';

class Kalkulator extends StatefulWidget {
  // const Kalkulator({ Key? key }) : super(key: key);
  //static const namaRoute = '/kalkulator-screen';
  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

enum Gender { male, female }

class _KalkulatorState extends State<Kalkulator> {
  Gender? jenisKelaminTerpilih;
  double ketinggian = 180;
  int berat = 60;
  int umur = 20;
  double bmi = 0.0;

  Widget sliderKetinggian() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Warna.warnaAktif,
      ),
      child: SliderTheme(
        data: const SliderThemeData(
            inactiveTrackColor: Warna.warnaAbu,
            activeTrackColor: Colors.white,
            thumbColor: Warna.warnaPink,
            overlayColor: Warna.warnaOverlay,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
        child: Container(
          width: 310,
          child: Column(
            children: [
              const Text(
                'HEIGHT',
                style: Warna.teksFormatLabel,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    ketinggian.toStringAsFixed(0),
                    style: Warna.teksFormatAngka,
                  ),
                  Text(
                    'cm',
                    style: Warna.teksFormatLabel,
                  )
                ],
              ),
              Slider(
                value: ketinggian,
                onChanged: (value) {
                  setState(() {
                    ketinggian = value;
                  });
                },
                min: 120,
                max: 220,
              ),
            ],
          ),
        ),
      ),
    );
  }

  double hitungBmi() {
    bmi = berat / pow(ketinggian / 100, 2);
    return bmi;
  }

  String getResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JenisKelamin(
                jenis: "MALE",
                iconJenis: Icons.male,
                warnaJenis: jenisKelaminTerpilih == Gender.male
                    ? Warna.warnaAktif
                    : Warna.warnaDeaktif,
                onTapButton: () {
                  setState(() {
                    jenisKelaminTerpilih = Gender.male;
                  });
                },
              ),
              JenisKelamin(
                jenis: "FEMALE",
                iconJenis: Icons.female,
                warnaJenis: jenisKelaminTerpilih == Gender.female
                    ? Warna.warnaAktif
                    : Warna.warnaDeaktif,
                onTapButton: () {
                  setState(() {
                    jenisKelaminTerpilih = Gender.female;
                  });
                },
              ),
            ],
          ),
          sliderKetinggian(),
          Container(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterBottom(
                  judul: 'WEIGHT',
                  nilaiCounter: berat,
                  pertambahan: () {
                    setState(() {
                      berat++;
                    });
                  },
                  pengurangan: () {
                    setState(() {
                      berat--;
                    });
                  },
                ),
                CounterBottom(
                  judul: 'AGE',
                  nilaiCounter: umur,
                  pertambahan: () {
                    setState(() {
                      umur++;
                    });
                  },
                  pengurangan: () {
                    setState(() {
                      umur--;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Warna.warnaPink,
                  ),
                  onPressed: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Hasil(
                            hasilBmi: hitungBmi(),
                            hasilKlasifikasi: getResult(),
                            komentarHasil: getInterpretation()),
                      ),
                    );
                  }),
                  child: Text(
                    'CALCULATE',
                    style: Warna.teksFormatButton,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
