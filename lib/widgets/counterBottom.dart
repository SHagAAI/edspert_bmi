import 'package:flutter/material.dart';
import '../utils/tema.dart';

class CounterBottom extends StatelessWidget {
  final String judul;
  final int nilaiCounter;
  final Function()? pertambahan;
  final Function()? pengurangan;

  const CounterBottom(
      {required this.judul,
      required this.nilaiCounter,
      required this.pertambahan,
      required this.pengurangan});
  //const CounterBottom({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Warna.warnaAktif,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          Text(
            judul,
            style: Warna.teksFormatLabel,
          ),
          Text(
            nilaiCounter.toString(),
            style: Warna.teksFormatAngka,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RawMaterialButton(
                elevation: 0.0,
                onPressed: pengurangan,
                shape: CircleBorder(),
                constraints: BoxConstraints.tightFor(width: 56, height: 56),
                fillColor: Warna.warnaCounterButton,
                child: Icon(Icons.remove),
              ),
              SizedBox(width: 5,),
              RawMaterialButton(
                elevation: 0.0,
                onPressed: pertambahan,
                shape: CircleBorder(),
                constraints: BoxConstraints.tightFor(width: 56, height: 56),
                fillColor: Warna.warnaCounterButton,
                child: Icon(Icons.add),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
