import 'dart:io';
import 'dart:math';

void main() {
  // print("Enter your number from 1 to 100 so that computer could guess it: ");
  // int input = int.parse(stdin.readLineSync()!);
  // randomSearch();
  // task2();
  // task2b();
  task3();
}

randomSearch() {
  int count = 0;
  int min = 0;
  int max = 100;
  int answer = 0;
  while (answer != 1) {
    int random = min + Random().nextInt(max - min);
    count++;
    print("Is it $random?\n1) Yes\n2) Greater\n3) Less");
    answer = int.parse(stdin.readLineSync()!);
    if (answer == 2) {
      min = random;
    } else if (answer == 3) {
      max = random;
    }
  }
  print("Got it in $count steps!");
}

task2() {
  int count = 0;
  int min = 0;
  int max = 100;
  int middle = 0;
  int random = Random().nextInt(100);
  print("Computer's choice is $random");
  while (random != middle) {
    middle = (min + max) ~/ 2;
    count++;
    if (random < middle) {
      max = middle;
    } else if (random > middle) {
      min = middle;
    }
  }
  print("Got it in $count steps!");
}

task2b() {
  int count = 0;
  int min = 0;
  int max = 100;
  int random = 0;
  int computerChoice = Random().nextInt(100);
  print("Computer's choice is $computerChoice");
  while (computerChoice != random) {
    random = min + Random().nextInt(max - min);
    count++;
    if (computerChoice > random) {
      min = random;
    } else if (computerChoice < random) {
      max = random;
    }
  }
  print("Got it in $count steps!");
}

task3() {
  List array = [];
  int countAmountRandom = 0;
  int countAmountBinary = 0;
  for (int i = 0; i <= 100; i++) {
    int numberFromArray = Random().nextInt(100);
    array.add(numberFromArray);

    int min = 0;
    int max = 100;

    int countRandom = 0;
    int randomGuess = 0;

    int middle = 0;
    int countBinary = 0;

    while (numberFromArray != randomGuess) {
      randomGuess = min + Random().nextInt(max - min);
      countRandom++;
      if (numberFromArray > randomGuess) {
        min = randomGuess;
      } else if (numberFromArray < randomGuess) {
        max = randomGuess;
      }
    }
    countAmountRandom += countRandom;

    while (numberFromArray != middle) {
      middle = (min + max) ~/ 2;
      countBinary++;
      if (numberFromArray < middle) {
      max = middle;
    } else if (numberFromArray > middle) {
      min = middle;
    }
    }
    countAmountBinary += countBinary;
  }
  print(array);
  String randomSearchSteps = (countAmountRandom/array.length).toStringAsFixed(2);
  String binarySearchSteps = (countAmountBinary/array.length).toStringAsFixed(2);
  print("Среднее количество шагов, которое потребовалось рандомному алгоритму: $randomSearchSteps");
  print("Среднее количество шагов, которое потребовалось бинарному алгоритму: $binarySearchSteps");

  double.parse(randomSearchSteps) > double.parse(binarySearchSteps) ? print("Бинарный алгоритм более эффективен.") : print("Рандомный алгоритм более эффективен.");
}
