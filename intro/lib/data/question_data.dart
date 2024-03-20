import 'package:intro/models/question.dart';

const questions = [
  Question(
      question: "1-Flutter nedir?",
      answers: [
        "Bir programlama dilidir.",
        "Bir çapraz platform mobil uygulama geliştirme framework'üdür.",
        "Bir veritabanı yönetim sistemi.",
        "Bir bulut bilişim hizmetidir."
      ],
      correctAnswer:
          "Bir çapraz platform mobil uygulama geliştirme framework'üdür."),
  Question(
      question: "2-Flutter hangi dili kullanır?",
      answers: ["dart", "Javascript", "c#", "java"],
      correctAnswer: "dart"),
  Question(
      question: "3-Flutter hangi şirket tarafından geliştirilmiştir?",
      answers: ["Microsoft", "Google", "Apple", "Facebook"],
      correctAnswer: "Google"),
  Question(
      question:
          "4-Flutter geliştirilen uygulamalar hangi platformda çalışabilir?",
      answers: [
        "Yalnızca ios",
        "Yalnızca android",
        "Yalnızca windows",
        "Hem ios hem de android"
      ],
      correctAnswer: "Hem ios hem de android"),
  Question(
      question:
          "5-Flutter'da UI (Kullanıcı Arayüzü) geliştirmek için hangi yapıyı kullanırsınız?",
      answers: ["Widgets","Modules","Blueprints","Components"],
      correctAnswer: "Widgets"),
  Question(
      question:
          "6-Flutter'da state yönetimini kolaylaştırmak için kullanılan yöntemlerden biri hangisidir?",
      answers: ["Flux","Redux","Vuex","GraphQL"],
      correctAnswer: "Redux"),
  Question(
      question:
          "7-Flutter ile bir mobil uygulama geliştirirken kullanılan widget'lar arasında hangisi genellikle bir listenin görüntülenmesi için kullanılır?",
      answers: ["Text","Image","ListView","Container"],
      correctAnswer: "ListView"),
  Question(
      question:
          "8-Flutter uygulaması geliştirirken, farklı cihaz boyutlarına uyum sağlamak için kullanılan bir yapı hangisidir?",
      answers: ["Scaffold","Flex","MediaQuery","AspectRatio"],
      correctAnswer: "MediaQuery"),
];