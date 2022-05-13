import 'package:flutter/material.dart';
import 'package:latihan_bmi/utils/tema.dart';

class Hasil extends StatelessWidget {
  //const Hasil({ Key? key }) : super(key: key);

  final double hasilBmi;
  final String hasilKlasifikasi;
  final String komentarHasil;

  const Hasil(
      {required this.hasilBmi,
      required this.hasilKlasifikasi,
      required this.komentarHasil});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              'Your Result',
              style: Warna.teksFormatJudul,
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Warna.warnaAktif,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    hasilKlasifikasi,
                    style: Warna.teksFormatKlasifikasi,
                  ),
                  Text(
                    hasilBmi.toStringAsFixed(1),
                    style: Warna.teksFormatBmi,
                  ),
                  Text(
                    komentarHasil,
                    textAlign: TextAlign.center,
                    style: Warna.teksFormatKomentar,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Warna.warnaPink,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'RE-CALCULATE',
                style: Warna.teksFormatButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
