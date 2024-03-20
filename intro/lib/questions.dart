import 'package:flutter/material.dart';
import 'package:intro/data/question_data.dart';
import 'package:intro/result.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}


// question_data.dart dosyasından gelen verileri oku
// ekrana soruları sırayla yerleştir, her cevapta soruyu 1 artır
// son soruya gelindiğinde ekrana BİTTİ yaz.
class _QuestionsScreenState extends State<QuestionsScreen> {
  Map<int, String?> selectedAnswers = {};
  int questionIndex = 0;
  String? selectedAnswer;
  bool isCorrect = false;
  int score =0;
  int blankCount = 0;
  
  
  

 void moveToNextPage() {
  if (questionIndex == questions.length - 1) {
    // Son soruya ulaşıldığında yeni sayfaya geçiş
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SonucSayfasi(
          correctCount: calculateCorrectAnswers(),
          wrongCount: calculateWrongAnswers(),
          blankCount: calculateBlankAnswer(),
        ),
      ),
    );
  } else {
    nextQuestion();
  }
}

int calculateCorrectAnswers() {
  int correctAnswers = 0;
  selectedAnswers.forEach((key, value) {
    if (value == questions[key].correctAnswer) {
      correctAnswers++;
    }
  });
  return correctAnswers;
}

int calculateWrongAnswers() {
  int wrongAnswers = 0;
  selectedAnswers.forEach((key, value) {
    if (value != null && value != questions[key].correctAnswer) {
      wrongAnswers++;
    }
  });
  return wrongAnswers;
}

int calculateBlankAnswer() {
  
  for (var value in selectedAnswers.values) {
    if (value == null || value.isEmpty) {
      blankCount++;
    }
  }
  return blankCount;
}





 Color getButtonColor(String answer) {
  if (selectedAnswers[questionIndex] != null) {
    if (selectedAnswers[questionIndex] == answer) {
      return questions[questionIndex].correctAnswer == answer ? Colors.green : Colors.red;
    }
  }
  return Colors.blue;
}



void checkAnswer(String answer) {
  setState(() {
    selectedAnswers[questionIndex] = answer; // Seçilen cevabı kaydediyorum
    if (selectedAnswers[questionIndex] == questions[questionIndex].correctAnswer) {
      isCorrect = true;
    } else {
      isCorrect = false;
    }
  });
}

void nextQuestion() {
  setState(() {
    if (questionIndex < questions.length - 1) {
      // Seçilen cevap boş mu diye kontrol ediyorum
      if (selectedAnswers[questionIndex] == null || selectedAnswers[questionIndex]!.isEmpty) {
        // Boş ise boş cevap sayısını artıyorum
        blankCount++;
      }
      questionIndex++;
    }
  });
}


  void previousQuestion() {
  setState(() {
    if (questionIndex > 0) {
      questionIndex--;
    }
  });
}

 // void answerQuestion() {
   // setState(() {
     // if (questionIndex < questions.length - 1) {
     //   questionIndex++;
      //}
    //});
 // }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.blue,
      title: const Text("Sorular"),
    ),
    backgroundColor: Colors.yellow,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questions[questionIndex].question,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: questions[questionIndex].answers.map((answer) {
              return ElevatedButton(
                onPressed: () => checkAnswer(answer),
                style: ElevatedButton.styleFrom(
                  backgroundColor: getButtonColor(answer), // Buton rengini dinamik olarak ayarlıyorum
                ),
                child: Text(
                  answer,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(questionIndex > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: previousQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Geri düğmesinin arka plan rengi
                ),
                child: const Text("Geri"),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: moveToNextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // İleri düğmesinin arka plan rengi
                ),
                child: const Text("İleri"),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}