import 'dart:io';
import 'dart:math';

void main() {
  print('Добро пожаловать в игру "Угадай число"');
  print('Сколько раундов вы хотите сыграть? (1-10, по умолчанию 3): ');
  int rounds = int.tryParse(stdin.readLineSync() ?? '') ?? 3;
  int userWins = 0;
  int computerWins = 0;

  for (int round = 1; round <= rounds; round++) {
    print('====================');
    print('Раунд $round');
    print('====================');

    int userScore = playUserRound();
    int computerScore = playComputerRound();

    if (userScore < computerScore) {
      userWins++;
      print('Вы выиграли раунд $round! Ваш счет: $userWins, Счет компьютера: $computerWins');
    } else if (computerScore < userScore) {
      computerWins++;
      print('Компьютер выиграл раунд $round! Ваш счет: $userWins, Счет компьютера: $computerWins');
    } else {
      print('Ничья в раунде $round. Ваш счет: $userWins, Счет компьютера: $computerWins');
    }
  }

  print('====================');
  if (userWins < computerWins) {
    print('Компьютер выиграл игру! Ваш счет: $userWins, Счет компьютера: $computerWins');
  } else if (computerWins < userWins) {
    print('Вы выиграли игру! Ваш счет: $userWins, Счет компьютера: $computerWins');
  } else {
    print('Игра завершилась в ничью! Ваш счет: $userWins, Счет компьютера: $computerWins');
  }
}

int playUserRound() {
  Random random = Random();
  int min = 1;
  int max = 100;
  int randomNum = min + random.nextInt(max - min + 1);
  int attempts = 0;

  print('Вы загадываете число от $min до $max');
  int userNumber = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  while (userNumber < min || userNumber > max) {
    print('Введите число от $min до $max: ');
    userNumber = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  }

  while (userNumber != randomNum) {
    print('Введите ваши догадки: ');
    String? resp = stdin.readLineSync() ?? "";
    int response = int.tryParse(resp) ?? 0;

    if (response < min || response > max) {
      print('Введите число от $min до $max: ');
    } else if (response < randomNum) {
      print('Загаданное число больше');
    } else if (response > randomNum) {
      print('Загаданное число меньше');
    }
    attempts++;
  }

  print('Вы угадали загаданное число ($randomNum) за $attempts попыток.');
  return attempts;
}

int playComputerRound() {
  Random random = Random();
  int min = 1;
  int max = 100;
  int randomNum = min + random.nextInt(max - min + 1);
  int attempts = 0;

  print('Компьютер загадывает число от $min до $max');

  int minRange = min;
  int maxRange = max;
  int computerGuess;

  do {
    computerGuess = minRange + (maxRange - minRange) ~/ 2;
    print('Компьютер думает, что это число $computerGuess');
    attempts++;

    if (computerGuess < randomNum) {
      print('Загаданное число больше');
      minRange = computerGuess + 1;
    } else if (computerGuess > randomNum) {
      print('Загаданное число меньше');
      maxRange = computerGuess - 1;
    }
  } while (computerGuess != randomNum);

  print('Компьютер угадал загаданное число ($randomNum) за $attempts попыток.');
  return attempts;
}
