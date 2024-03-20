import 'package:flutter/material.dart';

class SonucSayfasi extends StatelessWidget {
  final int correctCount;
  final int wrongCount;
  final int blankCount;

  const SonucSayfasi({
    required this.correctCount,
    required this.wrongCount,
    required this.blankCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "BİTTİ",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Doğru Sayısı: $correctCount",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Yanlış Sayısı: $wrongCount",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Boş sayısı: $blankCount", 
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.blue,
    );
  }
}
