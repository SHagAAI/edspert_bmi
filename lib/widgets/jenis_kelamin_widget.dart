import 'package:flutter/material.dart';
import '../utils/tema.dart';

class JenisKelamin extends StatelessWidget {
  //const JenisKelamin({ Key? key }) : super(key: key);
  final String jenis;
  final IconData iconJenis;
  final Color warnaJenis;
  final Function()? onTapButton;

  const JenisKelamin(
      {required this.jenis,
      required this.iconJenis,
      required this.warnaJenis,
      this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapButton,
      child: Container(
        margin: const EdgeInsets.all(5),
        width: 150,
        height: 130,
        decoration: BoxDecoration(
          color: warnaJenis,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconJenis,
              size: 80,
              color: Colors.white,
            ),
            Text(
              jenis,
              style: Warna.teksFormatLabel,
            ),
          ],
        ),
      ),
    );
  }
}
