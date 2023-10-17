import 'dart:io';
import 'dart:math';

void main(){
  
  print('Добро пожаловать в игру "Угадай сило\nВыберите режим игры\n1)Вы против компьютера\n2)Компьютер против вас');
String str = stdin.readLineSync()?? '';
if(str == '1'){
  taskOne();
}else if(str == '2'){
  taskTwo();
}
}

taskOne(){
  Random random = Random();
  int min = 1;
  int max = 100;
  int randomNum = min + random.nextInt(max - min + 1);
  int attempts = 0;
  int response;

  print('Добро пожаловать в игру');
  print('Попробуйте угадать загаданное число от $min до $max');

  do {
    print('Введите ваши догадки');
    String? resp = stdin.readLineSync()??"";
    response = int.parse(resp);

  if(response == null ){
    print('Введите действительное число');
  }else{
  attempts++;
  }
  if(response < min || response > max ){
    print('Введите число не меньше от $min и не больше от $max');
  }else if (response < randomNum){
    print('Загаданное число больше');
  }else if(response > randomNum){
    print('Загаданное число меньше');
  }else if(response == randomNum){
    print('Поздравляю вы угадали загаданное число($randomNum) за $attempts попыток');
    break;
  }
  
  } while (attempts != randomNum);
  
  print('Поздравляю вы угадали загаданное число($randomNum) за $attempts попыток');
  
}

taskTwo() {
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
