import 'dart:io';

void main() {
  int min = 1;
  int max = 100;
  int attempts = 0;
  String response;

  print('Пожалуйста загадайте число от 1 до 100.');

  while (min <= max) {
    int guessedNumber = (min + max) ~/ 2;
    print('Is it $guessedNumber?');
    print('> ');
    response = stdin.readLineSync()?? '';

    if (response == 'yes') {
      print('Угадал за $attempts попыток!');
      break;
    } else if (response == 'less') {
      max = guessedNumber - 1;
    } else if (response == 'greater') {
      min = guessedNumber + 1;
    } else {
      print('пожалуйста введите "yes," "less," or "greater."');
    }

    attempts++;
  }
}
