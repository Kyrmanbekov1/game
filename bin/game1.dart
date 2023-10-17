import 'dart:io';
import 'dart:math';

void main(){
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